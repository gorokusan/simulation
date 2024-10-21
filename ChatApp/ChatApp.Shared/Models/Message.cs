using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace ChatApp.Shared.Models
{
    public class Message
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string? SenderId { get; set; }
        public string Text { get; set; } = string.Empty;
        public DateTime Timestamp { get; set; }
        public string? Sender { get; set; }
        public string? UserId { get; set; }
        public User? User { get; set; }
        //public bool IsMine { get; set; }
        public string? RecipientId { get; set; }
        public User? Recipient { get; set; }

        public string SenderUserName { get; set; } = string.Empty;
    }
}
