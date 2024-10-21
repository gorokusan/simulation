using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;
using ChatApp.Client.Services.Interfaces;

namespace ChatApp.Client.Services
{
    public class UserService : IUserService
    {
        public Task<IEnumerable<string>> GetUsersAsync()
        {
            var users = new List<string> { "user1", "user2", "user3" };
            return Task.FromResult((IEnumerable<string>)users);
        }
    }
}
