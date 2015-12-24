require "rails_helper"

feature "Delete Article" do
	let(:user) { create :user }
	let(:user_two) { create :user }
	let(:article) { create :article, user: user }

	background do
		login_as user
		visit "/" # ask
	end
	
	scenario "User tries to delete his article" do

		expect(page).to have_text("Article was successfully destroyed")
	end

	scenario "User tries to delete not his article" do
		login_as user_two
		click_on "Delete"

		expect(page).to have_content("New article") # ask
	end
end