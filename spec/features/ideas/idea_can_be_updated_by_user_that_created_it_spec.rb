require 'rails_helper'

describe "when a user visits the ideas index" do
  it "allows user to edit the idea they created" do
    user = User.create!(username: "Gabezzz", password: "password")
    category = Category.create!(title: "Great")
    category2 = Category.create!(title: "Bad")
    idea = Idea.create!(description: "Jump off a bridge", category_id: category.id, user_id: user.id)
    visit category_ideas_path(category)
    click_on "Edit"

    expect(current_path).to eq(edit_category_idea_path(category, category.ideas.first))
    fill_in "idea[description]", with: "Ride a bike"

    select("Great", from: "idea_category_id").select_option
    click_on "Update Idea"

    expect(current_path).to eq(category_idea_path(category, category.ideas.first))
    expect(page).to have_content("Ride a bike")
    expect(page).to have_content("Great")
  end
end
