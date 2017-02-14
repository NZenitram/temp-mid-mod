require 'rails_helper'

RSpec.describe "a user can create and account and login" do
  scenario "user can create an account" do
    user = User.create!(email: "test@test.com", password_digest: BCrypt::Password.create("test"))

    visit '/'
    expect(page).to have_content("Login")
    expect(page).to have_content("Create User")

    click_link "Create User"

    expect(page).to have_content("Email")
    expect(page).to have_content("Password")

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    fill_in "Password confirmation", with: user.password_digest

    click_button "Create User"
  end

    it 'can login' do
    user = User.create!(email: "test@test.com", password_digest: BCrypt::Password.create("test"))


    visit 'login'
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")

    fill_in "Email", with: user.email
    fill_in "Password", with: "test"

    click_button "Login"

    expect(page).to have_content("You have successfully logged in.")

  end

    it 'can logout' do
    user = User.create!(email: "test@test.com", password_digest: BCrypt::Password.create("test"))


    visit 'login'
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")

    fill_in "Email", with: user.email
    fill_in "Password", with: "test"

    click_button "Login"

    expect(page).to have_content("You have successfully logged in.")

    click_button "Logout"

    expect(page).to have_content("You have successfully logged out.")

  end

  scenario "Mark a link as read" do
    user = User.create!(email: "test@test.com", password_digest: BCrypt::Password.create("test"))

    visit '/'
    expect(page).to have_content("Login")
    expect(page).to have_content("Create User")

    click_link "Create User"

    expect(page).to have_content("Email")
    expect(page).to have_content("Password")

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest

    click_button "Create User"

    expect(page).to have_content("Please fill out all forms.")
  end
end
