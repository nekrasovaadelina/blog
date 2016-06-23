require "rails_helper"

feature "Delete comment", js: true do
  let(:user) { create :user }
  let(:article) { create :article, user: user }
  let!(:comment) { create :comment, user: user, article: article }

  background do
    login_as user
    visit article_path(article)

    find(".comment-wrapper").click_on "Delete"
  end

  scenario "Comment disappears from page" do
    expect(page).not_to have_content(comment.text)
  end
end
