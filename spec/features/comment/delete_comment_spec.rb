require "rails_helper"

feature "Delete comment", js: true do
  let(:user) { create :user }
  let(:article) { create :article, user: user }
  let!(:comment) { create :comment, user: user, article: article }

  let(:comment_wrapper) { find(".comment-wrapper") }

  background do
    login_as user
    visit article_path(article)

    comment_wrapper.click_on "Delete"
  end

  scenario "Comment disappears from page" do
    expect(page).to have_no_content(comment.text)
  end
end
