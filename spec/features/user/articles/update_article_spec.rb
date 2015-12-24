require "rails_helper"

feature "Update Article" do
	let(:user) { create :user }
	let(:user_two) { create :user }
	let(:article) { create :article, user: user }

	background do
		login_as user
		visit edit_article_path(article)
	end
	
	scenario "User edit an article with valid data" do
		fill_form(:article, title: "simple title", text: "simple text")
		click_on "Submit"

		expect(page).to have_content("Article was successfully updated")
	end

	scenario "User edit an article with invalid data" do
		fill_form(:article, title: "simple title", text: "")
		click_on "Submit"

		expect(page).to have_content("can't be blank")
	end

	scenario "User tries to edit not his article" do
		login_as user_two
		visit edit_article_path(article)

		expect(page).to have_content("New article") # ask
	end
end