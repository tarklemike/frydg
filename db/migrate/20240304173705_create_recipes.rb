class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.float :prep_time
      t.float :cook_time
      t.string :level
      t.string :servings
      t.text :method
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
