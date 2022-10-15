require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'is valid with valid attributes' do
    recipe = Recipe.create(name: 'Recipe', user_id: 1)
    food = Food.create(name: 'Food', measurement_unit: 'unit', price: 100)
    recipe_food = RecipeFood.new(quantity: 1, recipe_id: recipe.id, food_id: food.id)
    expect(recipe_food).to_not be_valid
  end

  it 'is not valid without a recipe_id' do
    recipe_food = RecipeFood.new(recipe_id: nil, food_id: 1)
    expect(recipe_food).to_not be_valid
  end

  it 'is not valid without a food_id' do
    recipe_food = RecipeFood.new(recipe_id: 1, food_id: nil)
    expect(recipe_food).to_not be_valid
  end
end