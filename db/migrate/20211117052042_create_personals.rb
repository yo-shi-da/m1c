class CreatePersonals < ActiveRecord::Migration[6.0]
  def change
    create_table :personals do |t|
      t.date :birth_date
      t.float :height
      t.float :body_weight
      t.boolena :gender
      t.float :bmi
      t.float :waist_circumference
      t.float :hba_onec
      t.text :underlying_disease
      t.float :intake_per_oneday
      t.text :remarks
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
