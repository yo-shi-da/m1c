class User < ApplicationRecord
  validates :email, uniqueness: true

  has_one :personal
  has_many :groups
  has_many :meals
  has_many :members, dependent: :destroy
  has_many :joined_group, through: :members, source: :group
  has_many :favorites, dependent: :destroy
  has_many :meals_favorites, through: :favorites, source: :meal
  
  # guest
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest"
    end
  end

  # guest_admin
  def self.guest_admin
    find_or_create_by(email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest Admin"
      user.admin = true
    end
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
end
