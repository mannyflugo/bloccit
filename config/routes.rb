Bloccit::Application.routes.draw do
  get "posts/index"

  get "posts/show"

  get "posts/new"

  get "posts/edit"

  get "welcome/index"

  get "welcome/about"

  root to: 'welcome#index'
end
