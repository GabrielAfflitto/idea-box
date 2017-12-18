require 'rails_helper'

describe "user signs up for an account" do
  context "they visit the root page" do
    context "they click on the registration link" do
      context "they fill out the registration link" do
        it "a new user account is created" do
          visit '/'

          click_on "Sign up"

          expect(current_path).to eq(new_user_path)

          fill_in "user[username]", with: "KillaCam"
          fill_in "user[password]", with: "dipset"
          click_on "Create User"

          expect(page).to have_content("Welcome, KillaCam!")
        end
      end
    end

  end
end
