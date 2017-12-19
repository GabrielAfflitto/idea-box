require 'rails_helper'

describe "registered user can update ideas" do
  context "when a user visits their show page" do
    context "they see a list of their own ideas" do
      it "allows the user to edit each idea" do
        user = User.create!(username: "Gabezzz", password: "password")
        category = Category.create!(title: "Great")
        idea = Idea.create!(description: "Jump off a bridge", category_id: category.id, user_id: user.id)
        visit user_path(user.id)

        click_on "Edit"

        expect(current_path).to eq(edit_user_idea_path(idea.user_id, idea.id))
        fill_in "idea[description]", with: "Ride a bike"
        select("Great", from: "idea_category_id").select_option
        click_on "Update Idea"

        expect(current_path).to eq(user_path(user))
        expect(page).to have_content("Ride a bike")
        expect(page).to have_content("Great")
      end
    end
  end
end
