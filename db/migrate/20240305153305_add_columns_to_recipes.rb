class AddColumnsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :cuisine, :string
    add_column :recipes, :vegetarian, :boolean
    add_column :recipes, :vegan, :boolean
    add_column :recipes, :gluten_free, :boolean
    add_column :recipes, :dairy_free, :boolean
    add_column :recipes, :egg_free, :boolean
    add_column :recipes, :nut_free, :boolean
  end
end
