Bloccit::Application.routes.draw do
  devise_for :users

  resources :posts

  get "welcome/index"

  get "welcome/about"

  match "about" => 'welcome#about', via: :get
  root :to => 'welcome#index'
end
