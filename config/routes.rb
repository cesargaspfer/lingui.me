Rails.application.routes.draw do
  root 'welcome#index'
  resources :author_comment_posts
  resources :bookmarks
  resources :comments
  resources :posts
  resources :mother_languages
  resources :learning_languages
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
