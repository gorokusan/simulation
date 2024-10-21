using ChatApp.Client.Services;
using ChatApp.Client.Services.Interfaces;
using ChatApp.Client.ViewModels;
using ChatApp.Client.Views;
using Microsoft.Extensions.Logging;

namespace ChatApp.Client
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

            builder.Services.AddSingleton<IChatService, ChatService>();
            builder.Services.AddSingleton<IUserService, UserService>();
            builder.Services.AddSingleton<ILoginService, LoginService>();

            builder.Services.AddSingleton<LoginViewModel>();
            builder.Services.AddSingleton<ChatViewModel>();

            builder.Services.AddTransient<LoginPage>();
            builder.Services.AddTransient<ChatPage>();


            return builder.Build();


            //#if DEBUG
            //            builder.Logging.AddDebug();



            //#endif

        }
    }
}
