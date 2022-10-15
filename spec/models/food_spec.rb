# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    food = Food.new(name: 'Food', user_id: 1)
    expect(food).to_not be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(name: nil, user_id: 1)
    expect(food).to_not be_valid
  end

  it 'is not valid without a user_id' do
    food = Food.new(name: 'Food', user_id: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid with a duplicate name' do
    food = Food.create(name: 'Food', user_id: 1)
    expect(food).to_not be_valid
  end
end
