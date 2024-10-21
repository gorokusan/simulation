using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ChatApp.Shared.Models;

namespace ChatApp.Client.Services.Interfaces
{
    public interface ILoginService
    {
        Task<bool> LoginAsync(string userName, string password);
    }
}
