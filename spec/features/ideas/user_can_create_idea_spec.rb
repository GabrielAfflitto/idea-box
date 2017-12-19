require 'rails_helper'

describe "registered user can create new ideas" do
  context "they visit their show page" do
    context "they see the form for creating new ideas" do
      context "they fill out the idea form" do
        it "creates a new idea and registers on the home page" do
          Category.create(title: "Great")
          user = User.create(username: "KillaCam", password: "password")
          visit user_path(user)

          fill_in "idea[description]", with: "Jump off a bridge"
          select("Great", from: "idea[category_id]").select_option
          click_on "Create Idea"

          expect(current_path).to eq(user_path(user))
          expect(page).to have_content("Jump off a bridge")
          expect(page).to have_content("Great")
        end
      end
    end
  end
end
