using Microsoft.AspNetCore.SignalR.Client;
using ChatApp.Shared.Models;
using System.Threading.Tasks;
using System.Collections.Generic;
using System;
using ChatApp.Client.Services.Interfaces;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using Microsoft.Extensions.Options;
using System.Collections.ObjectModel;
using Microsoft.Extensions.Logging;

namespace ChatApp.Client.Services
{
    public class ChatService : IChatService
    {
        public HubConnection HubConnection { get; private set; }
        public ObservableCollection<Message> Messages { get; private set; }
        public event Action<string, string, DateTime>? MessageReceived;
        public event Action<Exception?>? ConnectionClosed;
        private string _authToken;
        private string _currentUserName;

        public ChatService()
        {
            Messages = new ObservableCollection<Message>();
        }


        public void Initialize(string authToken, string currentUserName)
        {
            if (string.IsNullOrWhiteSpace(currentUserName))
            {
                throw new ArgumentException("ユーザー名が空です。", nameof(currentUserName));
            }

            //_authToken = authToken;
            _currentUserName = currentUserName;

            Console.WriteLine($"Initializing ChatService for user {_currentUserName}");

            string hubUrl = $"http://localhost:5084/chatHub?userName={Uri.EscapeDataString(_currentUserName)}";
            Console.WriteLine($"HubConnection URL: {hubUrl}");

            HubConnection = new HubConnectionBuilder()
                .WithUrl(hubUrl)
                .WithAutomaticReconnect()
                    .ConfigureLogging(logging =>
                    {
                        logging.SetMinimumLevel(LogLevel.Debug);
                        logging.AddConsole();
                    })
                .Build();

            HubConnection.On<string, string, DateTime>("ReceiveMessage", (user, message, timestamp) =>
            {
                Console.WriteLine($"Received message from {user}: {message} at {timestamp}");
                MessageReceived?.Invoke(user, message, timestamp);
            });

            HubConnection.Closed += async (error) =>
            {
                Console.WriteLine($"SingalR connection closed: {error?.Message}");
                ConnectionClosed?.Invoke(error);
                await StartAsync();
            };
        }

        public string CurrentUserName => _currentUserName;

        public async Task StartAsync()
        {
            if (HubConnection == null)
            {
                throw new InvalidOperationException("ChatService is not initialized. Call Initialize method first.");
            }

            while (true)
            {
                try
                {
                    Console.WriteLine("Attempting to start HubConnection...");
                    await HubConnection.StartAsync();
                    Console.WriteLine("Connected to SiganlR Hub.");
                    break; //接続成功
                }
                catch (NullReferenceException nullEx)
                {
                    Console.WriteLine($"NullReferenceException is StartAsync: {nullEx.Message}");
                    throw;
                }
                catch (TaskCanceledException tcEx)
                {
                    Console.WriteLine($"TaskCanceledException in StartAsync: {tcEx.Message}");
                    // 必要に応じて再試行やエラーハンドリングを行う
                    await Task.Delay(3000);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"SignalR connection error: {ex.Message}");
                    //5秒待って再試行
                    await Task.Delay(3000);
                }
            }
        }

        //public async Task SendMessageAsync(string senderName, string recipientUserName, string messageText)
        public async Task SendMessageAsync(string senderName,  string messageText)
        {
            if (HubConnection == null)
            {
                throw new InvalidOperationException("ChatService is not initialized. Call Initialize method first.");
            }

            try
            {
                Console.WriteLine($"HubConnection State before sending message: {HubConnection.State}");
                Console.WriteLine($"Sending message from {senderName} : {messageText}");
                await HubConnection.InvokeAsync("SendMessage", senderName, messageText);
                Console.WriteLine("Message sent successfully.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error sending message: {ex.Message}");
                throw;
            }
        }

        public async Task<IEnumerable<Message>> GetMessagesAsync(string otherUserName)
        {
            if (HubConnection == null)
            {
                throw new InvalidOperationException("ChatService is not initialized. Call Initialize method first.");
            }

            return await HubConnection.InvokeAsync<IEnumerable<Message>>("GetMessages", otherUserName);
        }

        public async Task StopAsync()
        {
            if (HubConnection != null)
            {
                await HubConnection.StopAsync();
                await HubConnection.DisposeAsync();
                HubConnection = null;
            }
        }
    }
}
