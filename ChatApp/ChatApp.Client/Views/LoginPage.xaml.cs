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
            // �F�؂ɐ��������ꍇ�A�g�[�N���ƃ��[�U�[����ۑ�
            Preferences.Set("authToken", authToken);
            Preferences.Set("userName", userName);

            _chatService.Initialize(authToken, userName);

            await _chatService.StartAsync();

            // �`���b�g�y�[�W�ɑJ��
            await Shell.Current.GoToAsync("///ChatPage");
        }
        else
        {
            // �F�؂Ɏ��s�����ꍇ�A�G���[���b�Z�[�W��\��
            await DisplayAlert("���O�C�����s", "���[�U�[���܂��̓p�X���[�h������������܂���B", "OK");
        }
    }

    private async Task<string> AuthenticateAsync(string userName, string password)
    {
        // �T�[�o�[�ɑ΂��ĔF�؃��N�G�X�g�𑗐M���A�g�[�N�����擾���鏈��������
        // �����ł͉��ɌŒ�̃g�[�N����Ԃ��܂�
        await Task.Delay(500); // �T�[�o�[�Ƃ̒ʐM���V�~�����[�g
        return "dummy-auth-token";
    }
}