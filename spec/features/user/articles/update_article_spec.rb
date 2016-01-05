require "rails_helper"

feature "Update Article" do
	let(:user) { create :user }
	let(:user_two) { create :user }
	let(:article) { create :article, user: user }

	background do
		login_as user
		visit edit_user_article_path(article)
	end
	
	scenario "User edit an article with valid data" do
		fill_form(:user, attributes_for(:article))
		click_on "Submit"

		expect(page).to have_content("Article was successfully updated")
	end

	scenario "User edit an article with invalid data" do
		fill_form(:article, title: "", text: "")
		click_on "Submit"

		expect(page).to have_content("can't be blank")
	end

	scenario "User tries to edit not his article" do
		login_as user_two
		visit edit_user_article_path(article)

		expect(page).to have_content("New article") # ask if I can do that way
	end
end