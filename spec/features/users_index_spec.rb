# spec/features/users_index_spec.rb

require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:users) { create_list(:user, 3) } # Asumiendo que tienes FactoryBot para crear usuarios

  before do
    visit users_path
  end

  it 'shows all users with their number of posts' do
    users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_content("Number of posts: #{user.posts.size}")
    end
  end

  it 'redirects to user show page when clicking on a user' do
    first_user = users.first
    within("#user_#{first_user.id}") do
      click_link first_user.name
    end
    expect(current_path).to eq(user_path(first_user))
  end
end
