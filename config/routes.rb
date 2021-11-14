Rails.application.routes.draw do
  get 'aboutus/info'
  devise_for :users
  root 'home#index', page: 1
  get 'home/index'
  get 'home/category' => 'home#category'
  get 'myposts/all' => 'my_posts#all'
  get 'home/contactus'
  get '/abouts/info' => 'abouts#info'
  get '/abouts' => "abouts#info"

  resources :abouts
  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
