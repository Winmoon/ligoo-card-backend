LigooCard::Application.routes.draw do
  root 'establishment#index'

  scope :user do
    devise_for :users, :controllers => { sessions: "users/sessions" , registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
    resources :api do
      get 'establishments', on: :collection
      get 'near_establishments', on: :collection
      get 'news', on: :collection
      get 'establishment', on: :member
      get 'like', on: :member
      get 'coupon', on: :member
      get 'coupons', on: :collection
      get 'point', on: :member
      get 'points', on: :collection
      get 'profile', on: :collection
      post 'update_profile', on: :collection
    end
  end

  scope :admin do
    devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords" , registrations: "admins/registrations" }
    resources :admin_establishments, except: [:show]
  end
  resources :admin, only: :index

  scope :establishment do
    devise_for :establishments, controllers: { sessions: "establishments/sessions", passwords: "establishments/passwords" , registrations: "establishments/registrations" }
    resources :promotions
    resources :news
    resources :establishment_settings, only: [:index, :update]
    resources :qrcode, only: [:index, :show]
  end
  resources :establishment, only: [:index, :show]

end
