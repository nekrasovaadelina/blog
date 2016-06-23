require "rails_helper"

feature "Send email to blog owner" do
  background do
    visit "/"
  end

  scenario "Visitor sees that message was sent" do
    click_on "Contact Us!"
    fill_in "contact[name]", with: "Visitor"
    fill_in "contact[email]", with: "visitor@email.com"
    fill_in "contact[message]", with: "some message"
    click_on "Send message"

    expect(page).to have_content("Thank you for your message")
  end

  scenario "Admin sees user name, email and message in the letter" do
    click_on "Contact Us!"
    fill_in "contact[name]", with: "Visitor"
    fill_in "contact[email]", with: "visitor@email.com"
    fill_in "contact[message]", with: "some message"
    click_on "Send message"
    open_email("dmitry.fedorov@flatstack.com")

    expect(current_email).to have_content("some message")
  end
end
