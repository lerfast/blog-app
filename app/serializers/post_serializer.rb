# app/serializers/post_serializer.rb
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :created_at, :comments_counter, :likes_counter
  belongs_to :author
end
