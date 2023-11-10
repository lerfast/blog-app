# app/serializers/user_serializer.rb

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :posts
end

# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo, :bio, :posts_counter
end
