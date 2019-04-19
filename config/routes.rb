Rails.application.routes.draw do
  get 'users/home' => 'users#home'
  get 'users/login' => 'users#login'
  delete 'users/login' => 'users#logout'
  post 'users/login' => 'users#check'
  get 'listings' => 'listings#index'
  get 'listings/contact/:id' => 'listings#contact'
  get 'listings/:id' => 'listings#show'
  post 'messages/:id' => 'messages#create'
  get 'messages' => 'messages#show'
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: 'Applications#index'
  #resources :homepage, only: [:index, :create]
end
