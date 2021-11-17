class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.integer :sugar_amount, null: false
      t.integer :sugar_cube, null: false
      t.integer :classification, null: false
      t.string :image
      t.datetime :start_time, null: false
      t.boolean :reading_checks, null: false, default: false
      t.text :remarks
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
