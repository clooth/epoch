Epoch::Application.routes.draw do
  get "registrations/create"

  resources :authentications, :posts, :schedules

  devise_for :users,
    path_names: {
      sign_in: "login",
      sign_out: "logout",
    },
    controllers: {
      omniauth_callbacks: "authentications",
      registrations: "registrations"
    }

  root :to => 'home#index'
end
