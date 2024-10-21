using Microsoft.Maui.Controls;
using System;
using System.Threading.Tasks;
using ChatApp.Client.ViewModels;
using ChatApp.Client.Services.Interfaces;
using Microsoft.Extensions.DependencyInjection;

namespace ChatApp.Client.Views;
public partial class LoginPage : ContentPage
{
    private readonly IChatService _chatService;
    public LoginPage(IChatService chatService)
    {
        InitializeComponent();
        _chatService = chatService;
    }


    private async void OnLoginButtonClicked(object sender, EventArgs e)
    {
        string userName = UserNameEntry.Text;
        string password = PasswordEntry.Text;

        string authToken = await AuthenticateAsync(userName, password);

        if (!string.IsNullOrEmpty(authToken))
        {
            // 認証に成功した場合、トークンとユーザー名を保存
            Preferences.Set("authToken", authToken);
            Preferences.Set("userName", userName);

            _chatService.Initialize(authToken, userName);

            await _chatService.StartAsync();

            // チャットページに遷移
            await Shell.Current.GoToAsync("///ChatPage");
        }
        else
        {
            // 認証に失敗した場合、エラーメッセージを表示
            await DisplayAlert("ログイン失敗", "ユーザー名またはパスワードが正しくありません。", "OK");
        }
    }

    private async Task<string> AuthenticateAsync(string userName, string password)
    {
        // サーバーに対して認証リクエストを送信し、トークンを取得する処理を実装
        // ここでは仮に固定のトークンを返します
        await Task.Delay(500); // サーバーとの通信をシミュレート
        return "dummy-auth-token";
    }
}