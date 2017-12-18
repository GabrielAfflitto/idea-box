require 'rails_helper'

describe "registered user can log in" do
  context "they visit the root page" do
    context "they click the login link" do
      context "they fill out the log in information" do
        it "logs in a user" do
          user = User.create!(username: "KillaCam", password: "dipset")
          visit '/'

          click_on "Log in"

          expect(current_path).to eq(login_path)

          fill_in "user[username]", with: user.username
          fill_in "user[password]", with: user.password
          click_on "Log in"

          expect(page).to have_content("Welcome, #{user.username}!")
        end
      end
    end
  end
end
