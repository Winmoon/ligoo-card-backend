LigooCard::Application.routes.draw do
  root 'establishment#index'

  scope :user do
    devise_for :users, :controllers => { sessions: "users/sessions" , registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
    resources :points
  end

  scope :admin do
    devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords" , registrations: "admins/registrations" }
    resources :establishments, except: [:show]
  end
  resources :admin, only: :index

  scope :establishment do
    devise_for :establishments, controllers: { sessions: "establishments/sessions", passwords: "establishments/passwords" , registrations: "establishments/registrations" }
    resources :promotions
    resources :news
    resources :establishment_settings, only: [:index, :update]
  end
  resources :establishment, only: :index

end
