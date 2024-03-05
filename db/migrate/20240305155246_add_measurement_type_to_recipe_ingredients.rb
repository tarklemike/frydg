class AddMeasurementTypeToRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :recipe_ingredients, :measurement_type, :string
  end
end
