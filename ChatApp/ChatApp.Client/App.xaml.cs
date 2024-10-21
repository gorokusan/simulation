using ChatApp.Client.Views;
using Microsoft.Maui;
using Microsoft.Maui.Hosting;
using ChatApp.Client;

namespace ChatApp.Client
{
    public partial class App : Application
    {
        public static new App Current => (App)Application.Current;

        public IServiceProvider Services => Handler.MauiContext.Services;
        public App()
        {
            InitializeComponent();
            MainPage = new AppShell();
        }
    }
}
