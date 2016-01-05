require "rails_helper"

feature "Create article" do
	let(:user) { create :user }

	background do
		login_as user
		visit new_user_article_path
	end
	
	scenario "User creates a new article with valid data" do
		fill_form(:user, attributes_for(:article))
		click_on "Submit"

		expect(page).to have_content("Article was successfully created")
	end

	scenario "User creates a new article with invalid data" do
		fill_form(:user, title: "", text: "")
		click_on "Submit"

		expect(page).to have_content("can't be blank")
	end
end