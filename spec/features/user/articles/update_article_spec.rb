require "rails_helper"

feature "Update Article" do
  let(:user) { create :user }

  background do
    login_as user
  end

  scenario "User edits an article with valid data" do
    visit edit_user_article_path(create(:article, user: user))

    fill_form(:user, attributes_for(:article))
    click_on "Submit"

    expect(page).to have_content("Article was successfully updated")
  end

  scenario "User edits an article with invalid data" do
    visit edit_user_article_path(create(:article, user: user))

    fill_form(:article, title: "", text: "")
    click_on "Submit"

    expect(page).to have_content("can't be blank")
  end

  scenario "User tries to edit not his article" do
    visit edit_user_article_path(create(:article))

    expect(page).to have_content("Authorization error")
  end
end
