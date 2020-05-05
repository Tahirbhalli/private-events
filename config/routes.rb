Rails.application.routes.draw do
  resources :users
  match 'login' => 'users#login', via:[:get]
  match 'session' => 'users#auth', via:[:post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
