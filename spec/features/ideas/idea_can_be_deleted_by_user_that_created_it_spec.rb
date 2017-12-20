require 'rails_helper'

describe "ideas can be deleted by the user that created it" do
  context "when a user visits their show page" do
    context "they see a list of all their ideas" do
      context "they click the link to delete an idea" do
        it "should delete an idea" do
          user = User.create!(username: "KillaCam", password: "dipset")
          category = Category.create!(title: "Great")
          idea = Idea.create!(description: "Jump off a bridge", category_id: category.id, user_id: user.id)
          visit '/'
          click_on "Log in"

          expect(current_path).to eq(login_path)

          fill_in "username", with: user.username
          fill_in "password", with: user.password
          click_on "Log in"

          expect(current_path).to eq(user_path(user))
          expect(user.ideas.count).to eq(1)
          expect(page).to have_content("Jump off a bridge")
          click_on "Delete"

          expect(current_path).to eq(user_path(user))
          expect(user.ideas.count).to eq(0)
        end
      end
    end
  end
end
