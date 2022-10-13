require 'rails_helper'

RSpec.describe "foods", type: :feature do
  before :each do
    sign_in create(:user)
    visit foods_path
  end
  
it "foods index page" do
  expect(page).to have_content('Unit Price')
end

it "foods index page" do
  expect(page).to have_content('Food')
end

it "foods index page" do
  expect(page).to have_content('Actions')
end

it "foods index page" do
  expect(page).to have_content('Measurement Unit')
end

it "foods index page" do
  expect(page).to have_content('Add food')
end

it "foods index page" do
  expect(page).to have_content('Sign Out')
end

end
