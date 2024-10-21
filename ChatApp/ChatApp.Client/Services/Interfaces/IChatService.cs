using Microsoft.AspNetCore.SignalR.Client;
using ChatApp.Shared.Models;
using System.Collections.ObjectModel;
using System.Threading.Tasks;

namespace ChatApp.Client.Services.Interfaces
{
    public interface IChatService
    {
        public ObservableCollection<Message> Messages { get; }  
        event Action<string, string, DateTime>? MessageReceived;
        event Action<Exception?>? ConnectionClosed;

        void Initialize(string authToken, string currentUserName);
        Task StartAsync();
        Task StopAsync();
        //Task SendMessageAsync(string senderName, string recipientUserName, string messageText);
        Task SendMessageAsync(string senderName, string messageText);
        Task<IEnumerable<Message>> GetMessagesAsync(string otherUserName);

        string CurrentUserName { get; }
    }
}
