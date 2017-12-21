require 'rails_helper'

describe "an admin can create an image" do
  context "when an admin signs in" do
    context "they are taken to the dashboard" do
      context "they are shown they new image form" do
        it "allows them to create a new image" do
          admin = User.create!(username: "MF DOOM", password: "allcaps", role: 1)
          category = Category.create!(title: "Great")
          admin.ideas.create!(description: "All caps when you spell the man name", category_id: category.id)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
          visit admin_dashboard_path

          fill_in "image[name]", with: "DOOM"
          fill_in "image[url]", with: "https://res.cloudinary.com/tsl/image/upload/c_scale,f_auto,q_auto:good,w_680/960_b7nbge"
          click_on "Create Image"

          expect(current_path).to eq(admin_dashboard_path)
          expect(page).to have_content("DOOM")
        end
      end
    end
  end
end
