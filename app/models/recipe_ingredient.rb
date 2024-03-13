class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient, optional: true
  attr_accessor :ingredient_name # Virtual attribute for ingredient name input
  before_validation :find_or_create_ingredient

  private

  def find_or_create_ingredient
    return unless ingredient_name.present?
    # Check if ingredient with the same name exists in the database
    existing_ingredient = Ingredient.find_by(name: ingredient_name.strip.downcase)
    if existing_ingredient
      self.ingredient = existing_ingredient
    elsif ingredient_name == “”
      self.destroy
    else
      self.ingredient = Ingredient.create(name: ingredient_name.strip.downcase)
    end
  end
end
