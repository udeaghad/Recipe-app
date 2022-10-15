require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  it 'is valid with valid attributes' do
    inventory = Inventory.create(name: 'Inventory', user_id: 1)
    food = Food.create(name: 'Food', measurement_unit: 'unit', price: 100)
    inventory_food = InventoryFood.new(quantity: 1, inventory_id: inventory.id, food_id: food.id)
    expect(inventory_food).to_not be_valid
  end

  it 'is not valid without a inventory_id' do
    inventory_food = InventoryFood.new(inventory_id: nil, food_id: 1)
    expect(inventory_food).to_not be_valid
  end

  it 'is not valid without a food_id' do
    inventory_food = InventoryFood.new(inventory_id: 1, food_id: nil)
    expect(inventory_food).to_not be_valid
  end
end
