require 'rails_helper'


describe "when an admin visits the categories index page" do
  it "allows for them to delete a category" do
    categories = Category.all
    category = Category.create!(title: "Great")
    visit categories_path

    expect(categories.count).to eq(1)
    click_on "Delete"

    expect(current_path).to eq(categories_path)
    expect(categories.count).to eq(0)
  end
end
