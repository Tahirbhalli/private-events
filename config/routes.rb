Rails.application.routes.draw do
  resources :users, only:[:index, :show, :new, :create, :login, :session]
  get "/login" => "users#login"
  post "/session" => "users#session"
  root "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
