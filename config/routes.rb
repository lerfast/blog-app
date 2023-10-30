Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get 'users', to: 'users#index'    
  get 'users/:id', to: 'users#show' 

  
  get 'users/:user_id/posts', to: 'posts#index'  
  get 'posts/:id', to: 'posts#show'             
end
