class AddTelephoneToFoodbanks < ActiveRecord::Migration[7.1]
  def change
    add_column :foodbanks, :telephone, :string
  end
end
