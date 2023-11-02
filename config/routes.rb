Rails.application.routes.draw do
 
  get "up" => "rails/health#show", as: :rails_health_check

  
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy], shallow: true do
      
      put 'like', on: :member
      
      resources :comments, only: [:create]
    end
  end

  
  root 'users#index'
end
