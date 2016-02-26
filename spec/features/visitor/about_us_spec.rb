require "rails_helper"

feature "About Us" do
  background do
    visit root_path
  end

  scenario "Visitor clicks About us and sees info about team" do
    click_on "About us"

    expect(page).to have_content("Our Team")
  end
end
