Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end
  
  resources :genres do
    resources :books, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :books, only: [:show] do
    resources :comments
  end

  #resources :users, only: [:new, :create, :show]

  root to: 'welcome#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
