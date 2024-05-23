Rails.application.routes.draw do
  devise_for :users 
  resources :users, only: [] do
    resource :profile, only: [:edit, :update, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "boards#index"

  resources :boards do
    resources :tasks 
      
  end

  resources :tasks, only: [] do
    resources :comments, only: [:index, :new, :destroy, :create]
  end
  
end


