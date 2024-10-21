using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;
using System.Windows.Input;
using ChatApp.Client.Services.Interfaces;
using Microsoft.Maui.Controls;
using ChatApp.Client.Services;

namespace ChatApp.Client.ViewModels
{
    public partial class LoginViewModel : ObservableObject
    {
        private readonly ILoginService _loginService;

        [ObservableProperty]
        private string userName = string.Empty;

        [ObservableProperty]
        private string password = string.Empty;

        public event EventHandler? LoginCompleted;

        public LoginViewModel(ILoginService loginService)
        {
            _loginService = loginService;
        }

        [RelayCommand]
        public async Task LoginAsync()
        {
            var success = await _loginService.LoginAsync(userName, password);
            if (success)
            {
                Preferences.Set("userName", userName);
                await Shell.Current.GoToAsync("ChatPage");
                //ログイン完了を通知
                LoginCompleted?.Invoke(this, EventArgs.Empty);
            }
            else
            {
                await Application.Current.MainPage.DisplayAlert("エラー", "ログインに失敗しました。", "OK");
            }
        }
    }
}
