Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end
  
  resources :genres 
  
  resources :books

  # resources :books, only: [:show] do
  #   resources :comments
  # end

  resources :library, only: [:show]

  root to: 'welcome#home'
  
  post 'books/:id/borrow', to: 'books#borrow', as: 'borrow'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
