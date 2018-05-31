Rails.application.routes.draw do

  resources :languages
  root 'welcome#index'
  get 'ask', to: 'ask#index'
  post 'ask', to: 'ask#create'
  get 'user', to: 'user#index'
  get 'teach', to: 'teach#index'
  get 'learn', to: 'learn#index'
  get 'options', to: 'options#index'
  post 'options', to: 'options#create'
  get 'languages', to: 'languages#index'
  get 'notifications', to: 'notifications#index'
  # get 'bookmarks', to: 'notifications#index'
  # get 'posts', to: 'posts#index'
  
  # Para testes:
  resources :mother_languages
  resources :languages
  resources :author_comment_posts
  resources :bookmarks
  resources :comments
  resources :posts
  resources :learning_languages
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
