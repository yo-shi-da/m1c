class User < ApplicationRecord
  validates :email, uniqueness: true

  has_one :personal, dependent: :destroy
  has_one :group
  has_many :meals, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :joined_group, through: :members, source: :group
  has_many :favorites, dependent: :destroy
  has_many :meals_favorites, through: :favorites, source: :meal
  
  # guest
  def self.guest
    # User
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest"
    end
    # Personal
    if Personal.where(remarks: 'guest').empty?
      Personal.create(
        birth_date: '16 Mar 1990', 
        height: rand(160..190), 
        body_weight: rand(50..99),
        gender: '男',
        bmi: rand(18..30),
        waist_circumference: rand(65..99),
        hba_onec: rand(5..7),
        underlying_disease: 'guest',
        intake_per_oneday: rand(100..400),
        examination_ticket_number: rand(100000..999999),
        image: File.open("#{Rails.root}/public/great_man/#{1}.jpg"),
        remarks: 'guest',
        user_id: User.last.id
      )
    end
    # Meal
    if Meal.where(remarks: 'guest').empty?
      10.times do |i|
        classifications = %w(朝 昼 夜 間食)
        Meal.create(
        sugar_amount: rand(100..400),
        sugar_cube: rand(10..100),
        classification: classifications.sample,
        image: File.open("#{Rails.root}/public/menu/menu#{i + 1}.jpg"),
        start_time: Date.today - (i + 1),
        reading_checks: 'false',
        remarks: 'guest',
        user_id: User.last.id
      )
      end
    end
  end

  # guest_admin
  def self.guest_admin
    # User
    find_or_create_by(email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest Admin"
      user.admin = true
    end
    # Personal
    if Personal.where(remarks: 'guest_admin').empty?
      Personal.create(
        birth_date: '16 Mar 1990', 
        height: rand(160..190), 
        body_weight: rand(50..99),
        gender: '男',
        bmi: rand(18..30),
        waist_circumference: rand(65..99),
        hba_onec: rand(5..7),
        underlying_disease: 'guest_admin',
        intake_per_oneday: rand(100..400),
        examination_ticket_number: rand(100000..999999),
        image: File.open("#{Rails.root}/public/great_man/#{2}.jpg"),
        remarks: 'guest_admin',
        user_id: User.last.id
      )
    end
    # Meal
    if Meal.where(remarks: 'guest_admin').empty?
      10.times do |i|
        classifications = %w(朝 昼 夜 間食)
        Meal.create(
        sugar_amount: rand(100..400),
        sugar_cube: rand(10..100),
        classification: classifications.sample,
        image: File.open("#{Rails.root}/public/menu/menu#{i + 1}.jpg"),
        start_time: Date.today - (i + 1),
        reading_checks: 'false',
        remarks: 'guest_admin',
        user_id: User.last.id
      )
      end
    end
    # Group
    if Group.where(name: 'Guest_admin').empty?
      Group.create(name: 'Guest_admin', owner_id: User.last.id)
    end
    # Member
    if Member.where(user_id: Group.where(name: 'Guest_admin').first.owner_id, group_id: Group.where(name: 'Guest_admin').first.id).empty?
      Member.create(user_id: Group.where(name: 'Guest_admin').first.owner_id, group_id: Group.where(name: 'Guest_admin').first.id)
    end
    
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
end
