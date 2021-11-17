class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :owner_comment, null: false
      t.integer :owner_sugar_amount, null: false
      t.integer :difference, null: false
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
