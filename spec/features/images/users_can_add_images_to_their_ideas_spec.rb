require 'rails_helper'

describe "user can add images to their idea" do
  context "when a user visits their own homepage" do
    context "they fill out the form to create a new idea" do
      it "allows them to add images to their idea" do
        user = User.create!(username: "MF DOOM", password: "allcaps", role: 0)
        category = Category.create!(title: "Great")
        image = Image.create(name: "DOOM", url: "https://res.cloudinary.com/tsl/image/upload/c_scale,f_auto,q_auto:good,w_680/960_b7nbge")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        user.ideas.create!(description: "All caps when you spell the man name", category_id: category.id)
        visit user_path(user)

        fill_in "idea[description]", with: "Bake Cookies"
        select("Great", from: "idea_category_id").select_option
        select("DOOM", from: "idea_image_ids").select_option
        click_on "Create Idea"

        expect(page).to have_content("DOOM")
      end
    end
  end
end
