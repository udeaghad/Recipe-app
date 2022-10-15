require 'rails_helper'

RSpec.describe 'inventories', type: :feature do
  before :each do
    sign_in create(:user)
    visit inventories_path
  end

  it 'has a link to create a new inventory' do
    expect(page).to have_link 'New inventory'
  end

  it 'to have content Inventories' do
    expect(page).to have_content 'Your Inventories'
  end
end