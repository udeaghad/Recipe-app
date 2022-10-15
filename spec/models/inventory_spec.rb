require 'rails_helper'

RSpec.describe Inventory, type: :model do
  it 'is valid with valid attributes' do
    inventory = Inventory.new(name: 'Inventory', user_id: 1)
    expect(inventory).to_not be_valid
  end

  it 'is not valid without a name' do
    inventory = Inventory.new(name: nil, user_id: 1)
    expect(inventory).to_not be_valid
  end

  it 'is not valid without a user_id' do
    inventory = Inventory.new(name: 'Inventory', user_id: nil)
    expect(inventory).to_not be_valid
  end

  it 'is not valid with a duplicate name' do
    inventory = Inventory.create(name: 'Inventory', user_id: 1)
    inventory2 = Inventory.new(name: 'Inventory', user_id: 1)
    expect(inventory2).to_not be_valid
  end

end