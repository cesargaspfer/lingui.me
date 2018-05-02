Rails.application.routes.draw do
  resources :mother_languages
  root 'welcome#index'
  resources :author_comment_posts
  resources :bookmarks
  resources :comments
  resources :posts
  resources :learning_languages
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
