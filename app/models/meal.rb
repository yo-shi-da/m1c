class Meal < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_one :post
  has_many :favorites, dependent: :destroy
  has_many :users_favorites, through: :favorites, source: :user

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
