Rails.application.routes.draw do
  get '/' => 'users#home'
  get 'users/sign_in' => 'users#login'
  delete 'users/sign_in' => 'users#logout'
  post 'users/sign_in' => 'users#check'
  get 'users/sign_up' => 'users#signup'
  post 'users/sign_up' => 'users#create'
  get 'listings' => 'listings#index'
  get 'listings/contact/:id' => 'listings#contact'
  get 'listings/new' => 'listings#show'
  post 'listings/new' => 'listings#create'
  delete 'listings/new/:id' => 'listings#delete'
  post 'messages/:id' => 'messages#create'
  get 'messages' => 'messages#show'
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: 'Applications#index'
  #resources :homepage, only: [:index, :create]
end