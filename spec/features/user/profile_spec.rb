require "rails_helper"

feature "Show user profile" do
  let(:user) { create :user }
  let!(:article) { create :article, user: user}

  background do
    login_as(user)
    visit "/"
    click_on user.full_name
  end

  scenario "User see user name and email" do
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.email)
  end
end
