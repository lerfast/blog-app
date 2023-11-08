Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'users#index'
  
  authenticated :user do
    root to: 'users#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end

 
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy], shallow: true do
      put 'like', on: :member 
      resources :comments, only: [:new, :create]
    end
  end

  resources :posts, only: [] do
    resources :likes, only: [:create]
  end
end
