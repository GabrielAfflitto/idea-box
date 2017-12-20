require 'rails_helper'

describe "an admin can create a new category" do
  context "as a user that is also an admin" do
    it "allows them to create a new category" do
      admin = User.create!(username: "Kobe!", password: "mamba", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path

      fill_in "category[title]", with: "awesome"
      click_on "Create Category"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Admin Categories")
      expect(page).to have_content("awesome")
    end
  end
end
