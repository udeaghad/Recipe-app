require 'rails_helper'

RSpec.describe Food, type: :model do
  
  before :each do
    @food = Food.new(name: "Apple", measurement_unit: 'grams', price: '10.5')
  end

  before { subject.save }

  it 'name must not be blank.' do
    @food.name = nil
    expect(@food).to_not be_valid
  end
    
    it 'measurement unit must not be blank.' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'price must not be blank.' do
      @food.price = nil
      expect(@food).to_not be_valid
    end
end
