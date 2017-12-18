require 'rails_helper'

describe "when a user visits the new idea page" do
  it "is able to create a new idea" do
    category = Category.create(title: "Great")
    visit new_category_idea_path(category)

    fill_in "idea[description]", with: "Jump off a bridge"
    select("Great", from: "idea_category_id").select_option

    # save_and_open_page
    click_on "Create Idea"
    expect(current_path).to eq(category_ideas_path(category))
    expect(page).to have_content("Jump off a bridge")
    expect(page).to have_content("Great")
  end
end
