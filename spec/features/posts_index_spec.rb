# spec/features/posts_index_spec.rb

require 'rails_helper'

RSpec.describe 'Post index page for a user', type: :feature do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, author: user) }

  before do
    visit user_posts_path(user)
  end

  it 'shows all posts for the user' do
    posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text.truncate(100)) # O ajusta según tu lógica de truncamiento
      expect(page).to have_content("Number of comments: #{post.comments.size}")
      expect(page).to have_content("Number of likes: #{post.likes_counter}")
    end
  end

  it 'redirects to post show page when clicking on a post title' do
    first_post = posts.first
    within("#post_#{first_post.id}") do
      click_link first_post.title
    end
    expect(current_path).to eq(post_path(first_post))
  end
end
