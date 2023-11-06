require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  scenario 'I can see the username of all other users' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content(user.username)
    end
  end
end
