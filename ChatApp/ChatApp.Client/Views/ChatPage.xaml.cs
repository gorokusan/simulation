using ChatApp.Client.ViewModels;
using Microsoft.Maui.Controls;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.ObjectModel;
using ChatApp.Shared.Models;
using Microsoft.Maui.Controls;
using Microsoft.AspNetCore.SignalR.Client;
using ChatApp.Client.Services;
using ChatApp.Client.Services.Interfaces;

namespace ChatApp.Client.Views
{
    public partial class ChatPage : ContentPage
    {
        private ChatViewModel _viewModel;
        public ObservableCollection<Message> Messages { get; set; }

        public ChatPage(ChatViewModel viewModel)
        {
            InitializeComponent();
            _viewModel = viewModel;
            BindingContext = _viewModel;

            MessagesListView.ItemsSource = _viewModel.Messages;

        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();
            await _viewModel.OnAppearingAsync();
        }

        protected override async void OnDisappearing()
        {
            base.OnDisappearing();
        }

    }
}
