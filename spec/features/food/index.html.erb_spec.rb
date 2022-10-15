# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'foods', type: :feature do
  before :each do
    sign_in create(:user)

    @food = Food.create(name: 'Food', measurement_unit: 'unit', price: 100)
    visit foods_path
  end
  describe 'index' do
    it 'foods index page' do
      expect(page).to have_content 'Foods'
    end

    it 'foods index page' do
      expect(page).to have_content('Food')
    end

    it 'have a table with the food name' do
      expect(page).to have_content(@food.name)
    end

    it 'foods index page' do
      expect(page).to have_content('Sign Out')
    end
  end
end
