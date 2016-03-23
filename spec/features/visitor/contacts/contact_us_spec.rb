require "rails_helper"

feature "Send email to blog owner" do
  let(:contact) { create :contact }

  background do
    visit "/"
    click_on "Contact Us!"
    fill_form(:contact, attributes_for(:contact))
    click_on "Send message"
  end

  scenario "Visitor sees that message was sent" do
    expect(page).to have_content("Thank you for your message")
  end

  scenario "Admin sees user name, email and message in the letter" do
    open_email("dmitry.fedorov@flatstack.com")
    expect(current_email).to have_content(:contact)
  end
end
