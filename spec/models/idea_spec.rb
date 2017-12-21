require 'rails_helper'

describe Idea do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a description" do
        user = User.create(username: "KillaCam", password: "pass")
        category = Category.create(title: "Great")
        idea = user.ideas.create(category_id: category, user_id: user)

        expect(idea).to be_invalid
      end

      it "is invalid without a category" do
        user = User.create(username: "KillaCam", password: "pass")
        idea = user.ideas.create(description: "Jump off a bridge", user_id: user)

        expect(idea).to be_invalid
      end

      it "is invalid without a user"do
        category = Category.create(title: "Great")
        idea = Idea.create(description: "Jump off a bridge", category_id: category)

        expect(idea).to be_invalid
      end
    end
  end
end
