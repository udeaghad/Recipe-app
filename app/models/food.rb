class Food < ApplicationRecord
  has_many :inventory_foods, dependent: :destroy
  has_many :inventories, through: :inventory_foods, dependent: :destroy
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0 }
end
