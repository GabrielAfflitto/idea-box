require 'rails_helper'


describe "when an admin visits the categories index page" do
  it "allows for them to delete a category" do
    admin = User.create!(username: "Lil B", password: "basedgod", role: 1)
    Category.create!(title: "Great")
    categories = Category.all

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(categories.count).to eq(1)
    click_on "Delete"

    expect(current_path).to eq(admin_dashboard_path)
    expect(categories.count).to eq(0)
  end
end
