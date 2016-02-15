require "rails_helper"

feature "Show user profile" do
  let(:user) { create :user }
  let!(:article) { create :article, user: user }

  background do
    visit "/"
    click_on user.full_name
  end

  scenario "Visitor see user name and not see email" do
    expect(page).to have_content(user.full_name)
    expect(page).not_to have_content(user.email)
  end
end
