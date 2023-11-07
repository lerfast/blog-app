# spec/features/post_show_spec.rb

require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  # Asegúrate de que los comentarios están asociados con el post y el usuario
  let!(:comments) do
    create_list(:comment, 3, post:, user:)
  end
  before do
    visit post_path(post)
  end

  it 'shows the post details with comments' do
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
    expect(page).to have_content("Comments: #{post.comments.size}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
    comments.each do |comment|
      expect(page).to have_content(comment.user.name)
      expect(page).to have_content(comment.text)
    end
  end
end
