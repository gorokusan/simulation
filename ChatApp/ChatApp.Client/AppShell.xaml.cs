using ChatApp.Client.Views;

namespace ChatApp.Client
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            Routing.RegisterRoute("LoginPage", typeof(LoginPage));
            Routing.RegisterRoute("ChatPage", typeof(ChatPage));

        }
    }
}
