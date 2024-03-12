class CreateFoodbanks < ActiveRecord::Migration[7.1]
  def change
    create_table :foodbanks do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
