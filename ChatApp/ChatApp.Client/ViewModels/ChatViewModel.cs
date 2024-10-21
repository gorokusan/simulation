using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using Microsoft.Maui.Dispatching;
using ChatApp.Client.Services.Interfaces;
using ChatApp.Shared.Models;

namespace ChatApp.Client.ViewModels
{
    public partial class ChatViewModel : ObservableObject
    {
        private readonly IChatService _chatService;

        [ObservableProperty]
        private string newMessageText = string.Empty;

        public ObservableCollection<Message> Messages { get; } = new();

        private string _currentUserName = string.Empty;

        public ChatViewModel(IChatService chatService, IUserService userService)
        {
            //string hubUrl = "http://localhost:5084/chatHub";

            _chatService = chatService;

            var authToken = Preferences.Get("authToken", string.Empty);
            _currentUserName = Preferences.Get("userName", string.Empty);

            _chatService.Initialize(authToken, _currentUserName);

            _chatService.MessageReceived += OnMessageReceived;
            _chatService.ConnectionClosed += OnConnectionClosed;
        }

        public async Task OnAppearingAsync()
        {
             await InitializeAsync();
        }

        public async Task InitializeAsync()
        {
            await _chatService.StartAsync();
        }

        private void OnMessageReceived(string user, string message, DateTime timestamp)
        {
            MainThread.BeginInvokeOnMainThread(() =>
            {

                var receivedMessage = new Message
                {
                    Sender = user,
                    Text = message,
                    Timestamp = timestamp,
                    //IsMine = user == _currentUserName, //受信したメッセージは自分の物ではない
                    SenderId = null,
                    UserId = null
                };
                Messages.Add(receivedMessage);
            });
        }

        public async void OnConnectionClosed(Exception? error)
        {
            Console.WriteLine($"Connection closed: {error?.Message}");
            await InitializeAsync();
        }

        [RelayCommand]
        public async Task SendMessageAsync()
        {
            if (string.IsNullOrWhiteSpace(NewMessageText))
            {
                await Application.Current.MainPage.DisplayAlert("エラー", "メッセージを入力してください。", "OK");
                return;
            }

            try
                {
                    var senderName = _currentUserName;
                    //var recipientUserName = SelectedUser;
                    var messageText = NewMessageText;

                    //await _chatService.SendMessageAsync(senderName, recipientUserName, messageText);
                    await _chatService.SendMessageAsync(senderName, messageText);

                var message = new Message
                    {
                        Text = messageText,
                        Sender = senderName,
                        Timestamp = DateTime.Now,
                        //IsMine = true
                    };
                    Messages.Add(message);

                    NewMessageText = string.Empty;
                }
                catch (Exception ex)
                {
                    await Application.Current.MainPage.DisplayAlert("送信エラー", "メッセージの送信に失敗しました。", "OK");
                }
        }
    }
}
