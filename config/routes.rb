Rails.application.routes.draw do
  resources :users
  resources :event, only:[:new,:index,:create]
  match 'login' => 'users#login', via:[:get]
  match 'all/events' => 'event#all', via:[:get]
  match 'session' => 'users#auth', via:[:post]
  match 'events/Home' => 'event#index', via:[:get]
  match 'join/event' => 'event#join' ,via:[:get]
  match 'registed' => 'event#register',via:[:post]
  root 'users#login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
