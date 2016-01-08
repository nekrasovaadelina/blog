require "rails_helper"

feature "Delete Article" do
  let(:user) { create :user }
  let(:user_two) { create :user }
  let(:article) { create :article, user: user }

  scenario "User tries to delete his article" do
    login_as user
    visit article_path(article)

    click_on "Delete"

    expect(page).to have_text("Article was successfully destroyed")
  end

  scenario "User tries to delete not his article" do
    login_as user_two
    visit article_path(article)

    expect(page).not_to have_content("Delete")
  end
end
