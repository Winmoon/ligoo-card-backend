LigooCard::Application.routes.draw do

  root 'establishment#index'

  scope :admin do
    devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords" , registrations: "admins/registrations" }
    resources :establishments, except: [:show]
  end
  resources :admin, only: :index

  scope :establishment do
    devise_for :establishments, controllers: { sessions: "establishments/sessions", passwords: "establishments/passwords" , registrations: "establishments/registrations" }
    resources :promotions
    resources :news
  end
  resources :establishment, only: :index

end
