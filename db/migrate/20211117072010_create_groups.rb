class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.bigint :owner_id, index: true

      t.timestamps
    end
    add_foreign_key :groups, :users, column: :owner_id
  end
end
