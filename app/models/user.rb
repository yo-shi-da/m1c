class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :meals, through: :favorites, source: :meal
  has_many :joined_group, through: :members, source: :group

  has_many :meals
  has_many :personals
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
