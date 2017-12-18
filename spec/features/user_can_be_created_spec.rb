require "rails_helper"

RSpec.describe do
  describe "when a user visits the new user page" do
    it  "lets them create a new user" do
      visit new_user_path
      fill_in "user[username]", with: "HPotter"
      fill_in "user[password]", with: "hermione"
      click_on "Create User"

      expect(page).to have_content("HPotter")
    end
  end
end
