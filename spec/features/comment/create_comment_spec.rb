require "rails_helper"

feature "Create comment", js: true do
  let(:user) { create :user }
  let(:article) { create :article, user: user }

  background do
    login_as user
    visit article_path(article)

    fill_in "comment_text", with: "My beautiful comment"
    click_on "Add comment"
  end

  scenario "Comment shows on the page" do
    expect(page).to have_content("My beautiful comment")
  end

  scenario "Field gets empty" do
    expect(page).to have_field("comment_text", with: "")
  end
end
