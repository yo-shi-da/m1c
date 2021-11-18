class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :meals, through: :favorites, source: :meal
  has_many :members, dependent: :destroy
  has_many :joined_group, through: :members, source: :group

  has_many :meals
  has_many :personals
  
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest"
    end
  end

  def self.guest_admin
    find_or_create_by(email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest Admin"
      user.admin = true
    end
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
