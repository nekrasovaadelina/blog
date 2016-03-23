require "rails_helper"

feature "User show" do
  let(:user) { create :user }

  background do
    login_as user
    visit "/"
  end

  scenario "User clicks on his name and sees page with name and email" do
    click_on user.full_name

    expect(page).to have_content(:user)
  end
end
