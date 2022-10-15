# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid with valid attributes' do
    recipe = Recipe.new(name: 'Recipe', user_id: 1)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a name' do
    recipe = Recipe.new(name: nil, user_id: 1)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a user_id' do
    recipe = Recipe.new(name: 'Recipe', user_id: nil)
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a duplicate name' do
    recipe = Recipe.create(name: 'Recipe', user_id: 1)
    expect(recipe).to_not be_valid
  end
end
