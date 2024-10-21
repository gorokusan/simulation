using Microsoft.AspNetCore.SignalR;
using ChatApp.Shared.Models;
using ChatApp.Server.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using System.Collections.Concurrent;

namespace ChatApp.Server.Hubs
{
    public class ChatHub : Hub
    {
        private readonly ApplicationDbContext _context;

        private static readonly ConcurrentDictionary<string, string> _userConnections = new();

        private string _userName;
        public ChatHub(ApplicationDbContext dbcontext)
        {
            _context = dbcontext;
        }

        public override async Task OnConnectedAsync()
        {
            var httpContext = Context.GetHttpContext();
            _userName = httpContext?.Request.Query["userName"].ToString();

            Console.WriteLine($"OnConnectedAsync called. : _userName = {_userName}");

            if (!string.IsNullOrEmpty(_userName))
            {
                _userConnections[_userName] = Context.ConnectionId;
                Console.WriteLine($"User {_userName} connected with ConnectionId {Context.ConnectionId}");
            }
            else
            {
                Console.WriteLine("ユーザー名が提供されていません。");
            }

            await base.OnConnectedAsync();
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            if (!string.IsNullOrEmpty(_userName))
            {
                _userConnections.TryRemove(_userName, out _);
                Console.WriteLine($"User {_userName} disconnected.");
            }

            await base.OnDisconnectedAsync(exception);
        }

        //public async Task SendMessage(string senderName, string recipientUserName, string messageText)
        public async Task SendMessage(string senderName, string messageText)
        {
            //Console.WriteLine($"SendMessage called with senderName: {senderName}, recipientUserName: {recipientUserName}, messageText: {messageText}");
            Console.WriteLine($"SendMessage called with senderName: {senderName}, messageText: {messageText}");

            var message = new Message
            {
                Text = messageText,
                Timestamp = DateTime.UtcNow,
                Sender = senderName,
                SenderId = senderName, // ユーザーIDの代わりにユーザー名を使用
                //RecipientId = recipientUserName // ユーザー名を使用
            };

            _context.Messages.Add(message);
            await _context.SaveChangesAsync();

            //if (_userConnections.TryGetValue(recipientUserName, out var recipientConnectionId))
            //{
            //    await Clients.Client(recipientConnectionId).SendAsync("ReceiveMessage", senderName, messageText, message.Timestamp);
           // }

            var connections = _userConnections.Where(u => u.Key != senderName).Select(u => u.Value).ToList();
            if (connections.Any())
            {
                await Clients.Clients(connections).SendAsync("ReceiveMessage", senderName, messageText, message.Timestamp);
            }

        }

        public async Task<IEnumerable<Message>> GetMessages(string otherUserName)
        {
            //var currentUserName = Context.User?.Identity?.Name;

            Console.WriteLine($"GetMessages: _userName = {_userName}, otherUserName = {otherUserName}");

            //var currentUserName = _userName;

            if (string.IsNullOrEmpty(_userName))
            {
                throw new HubException("ユーザ情報が取得できません。");
            }

            var messages = await _context.Messages
                .Where(m =>
                    (m.SenderId == _userName && m.RecipientId == otherUserName) ||
                    (m.SenderId == otherUserName && m.RecipientId == _userName))
                .OrderBy(m => m.Timestamp)
                .ToListAsync();

            return messages;
        }
    }
}
