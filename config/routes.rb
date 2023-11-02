Rails.application.routes.draw do
  # Ruta para verificar la salud de la aplicación
  get "up" => "rails/health#show", as: :rails_health_check

  # Rutas para recursos de usuarios
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    # Rutas anidadas para recursos de posts dentro de usuarios
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy], shallow: true do
      # Ruta para la acción like de un post
      put 'like', on: :member
      # Rutas anidadas para recursos de comentarios dentro de posts
      resources :comments, only: [:create]
    end
  end

  # Ruta raíz de la aplicación
  root 'users#index'
end
