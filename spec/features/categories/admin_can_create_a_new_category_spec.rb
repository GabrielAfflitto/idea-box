require 'rails_helper'

describe "when an admin visits the page" do
  it 'it can create a user' do
    skip
    visit new_category_path

    fill_in "category[title]", with: "Great"
    click_on "Create Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Great")
  end
end
