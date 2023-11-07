require 'rails_helper'

RSpec.feature "User Posts", type: :feature do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:comment) { create(:comment, post: post) }

  scenario "user visits the user post index page" do
    visit user_posts_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.count}")
    expect(page).to have_content(post.title)
    expect(page).to have_content("Number of comments: #{post.comments.count}")
    expect(page).to have_content("Number of likes: #{post.likes_counter}")
    expect(page).to have_content(comment.user.name)
    expect(page).to have_link(post.title, href: post_path(post))

    click_link post.title

    expect(current_path).to eq(post_path(post))
  end
end

RSpec.feature "Post", type: :feature do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }
    let!(:comment) { create(:comment, post: post) }
  
    scenario "user visits the post show page" do
      visit post_path(post)
  
      expect(page).to have_content(post.title)
      expect(page).to have_content(user.name)
      expect(page).to have_content("Comments: #{post.comments.count}")
      expect(page).to have_content("Likes: #{post.likes_counter}")
      expect(page).to have_content(post.text)
      expect(page).to have_content(comment.user.name)
      expect(page).to have_content(comment.text)
  
      fill_in "New Comment", with: "This is a new comment."
      click_button "Add Comment"
  
      expect(page).to have_content("This is a new comment.")
    end
  end
