require 'rails_helper'

RSpec.describe "an authencticated user can add links" do
  scenario "a user can add links" do

    user = User.create!(email: "test@test.com", password_digest: BCrypt::Password.create("test"))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    expect(page).to have_content("Title")
    expect(page).to have_content("Url")

    fill_in "Title", with: "Example"
    fill_in "Url", with: "http://www.example.com"

    click_button "Create Link"
    expect(page).to have_content("Example")
    expect(page).to have_content("http://www.example.com")
  end

  scenario "a user cannot add invalid links" do

    user = User.create!(email: "test@test.com", password_digest: BCrypt::Password.create("test"))

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    expect(page).to have_content("Title")
    expect(page).to have_content("Url")

    fill_in "Title", with: "Example"
    fill_in "Url", with: "http://www.example"

    click_button "Create Link"
    expect(page).to have_content("#{link.title} not save, please make sure URL is valid")


  end
end
