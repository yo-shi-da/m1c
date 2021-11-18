class Meal < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, source: :user
  has_one :post  
  belongs_to :user

  # CSV
  def self.csv_attributes
    ["sugar_amount", "sugar_cube", "classification", "remarks", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{ |attr| task.send(attr) }
      end
    end
  end
  
end
