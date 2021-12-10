class CreatePersonals < ActiveRecord::Migration[6.0]
  def change
    create_table :personals do |t|
      t.date :birth_date, null: false
      t.float :height, null: false
      t.float :body_weight, null: false
      t.integer :gender, null: false
      t.float :bmi, null: false
      t.float :waist_circumference, null: false
      t.float :hba_onec, null: false
      t.text :underlying_disease, null: false
      t.float :intake_per_oneday, null: false
      t.integer :examination_ticket_number, null: false
      t.string :image
      t.text :remarks
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
