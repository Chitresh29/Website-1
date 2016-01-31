Rails.application.routes.draw do
  devise_for :admins
  resources :posts
  resources :contacts, only: [:new, :create]
  get 'resume/index'
  get 'welcome/index'
  root 'welcome#index'

  get '*path!' => redirect('/')
end
