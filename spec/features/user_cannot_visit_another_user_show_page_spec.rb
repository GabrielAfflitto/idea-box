require 'rails_helper'

describe "a user cannot visit another users show page" do
  context "when a user signs in" do
    context "they can only see their show page" do
      it "must error out if they visit a show page other than their own" do
        user = User.create!(username: "BiggieSmalls", password: "brooklyn")
        user2 = User.create!(username: "BigL", password: "harlem")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit user_path(user2)

        expect(page).to have_content("The page you were looking for doesn't exist.")
      end
    end
  end
end
