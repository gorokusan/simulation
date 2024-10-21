using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;
using ChatApp.Client.Services.Interfaces;
using ChatApp.Shared.Models;

namespace ChatApp.Client.Services
{
    public class LoginService : ILoginService
    {
        private readonly HttpClient _httpClient;

        public LoginService()
        {
            _httpClient = new HttpClient();
        }

        public async Task<bool> LoginAsync(string userName, string password)
        {
            var loginModel = new
            {
                UserName = userName,
                Password = password
            };

            try
            {
                var response = await _httpClient.PostAsJsonAsync("http://localhost:5084/api/Account/Login", loginModel);

                if (response.IsSuccessStatusCode)
                {
                    var token = await response.Content.ReadAsStringAsync();
                    //トークンをセキュアに保存
                    await SecureStorage.SetAsync("authToken", token);
                    return true;
                }
                else
                {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    Console.WriteLine($"Login failed with status code {response.StatusCode}: {errorContent}");
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An exception occured during login: {ex.Message}");
                return false;
            }
        }
    }
}
