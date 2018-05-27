Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/posts')
  get 'posts', to: 'posts#index'
  post 'posts', to: 'posts#create'
  delete 'posts', to: 'posts#delete'
  put 'posts', to: 'posts#update'
  post 'add_friend', to: 'posts#add_friend'
  post 'unfriend', to: 'posts#unfriend'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
