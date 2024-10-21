using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ChatApp.Shared.Models
{
    public class User
    {
        [Key]
        public string Id { get; set; } = string.Empty;
        [Required]
        public string UserName { get; set; } = string.Empty;
        [JsonIgnore]
        public ICollection<Message> Messages { get; set; } = new List<Message>();
    }
}
