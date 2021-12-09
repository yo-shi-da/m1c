class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.integer :classification
      t.string :food_name
      t.integer :food_amount
      t.integer :sugar_amount

      t.timestamps
    end
  end
end
