class Meal < ApplicationRecord
  validates :sugar_amount, presence: true
  validates :sugar_cube, presence: true
  validates :classification, presence: true
  validates :start_time, presence: true
  validates :sugar_amount, length: { maximum: 3 }
  validates :sugar_cube, length: { maximum: 3 }

  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_one :post, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users_favorites, through: :favorites, source: :user

  enum classification: {
    朝: 0,
    昼: 1,
    夜: 2,
    間食: 3
  }

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
