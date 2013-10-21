LigooCard::Application.routes.draw do

  devise_for :establishments
  root 'establishments#index'

  scope "admin" do
    devise_for :admins, controllers: { sessions: "sessions", passwords: "passwords" , registrations: "registrations" }
    resources :establishments, except: [:edit, :update, :show]
  end
  resources :admin, only: :index


end
