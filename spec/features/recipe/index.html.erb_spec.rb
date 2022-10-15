require 'rails_helper'

RSpec.describe 'recipes', type: :feature do
  before :each do
    sign_in create(:user)
    visit recipes_path
  end

  it 'has a link to create a new recipe' do
    expect(page).to have_link 'New Recipe'
  end

  it 'to have content Recipes' do
    expect(page).to have_content 'Recipes'
  end

end