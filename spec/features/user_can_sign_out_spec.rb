require 'rails_helper'

describe "a user can sign out" do
  context "on any page" do
    context "when a user clicks on the log out link" do
      it "should log the user out" do
        user = User.create!(username: "KillaCam", password: "dipset")
        visit root_path
        click_on "Log in"

        expect(current_path).to eq(login_path)

        fill_in "username", with: "KillaCam"
        fill_in "password", with: "dipset"
        click_on "Log in"

        expect(page).to have_content("Welcome, KillaCam!")
        click_on "Log out"

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You have logged out")
      end
    end
  end
end
