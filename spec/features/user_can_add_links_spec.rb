require 'rails_helper'

RSpec.describe "an authencticated user can add links" do
  scenario "a user can add links" do

    user = User.create!(email: "test@test.com", password_digest: BCrypt::Password.create("test"))

  end
end
