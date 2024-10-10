class Recipe < ApplicationRecord
  validates :recipe_name, presence: true
  validates :meal_type, presence: true
  validates :source, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  validates :preperation_time, presence: true, numericality: { only_integer: true }
  validates :cooking_time, presence: true, numericality: { only_integer: true }
end
