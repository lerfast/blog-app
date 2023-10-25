class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Método para obtener las 3 publicaciones más recientes
  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  # Otros métodos adicionales pueden ir aquí
end
