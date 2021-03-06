FactoryBot.define do

  factory :meal do
    sugar_amount { '100' }
    sugar_cube { '25' }
    classification { '朝' }
    image { File.open("#{Rails.root}/spec/factories/menu5.jpg") }
    start_time { 'Tur, 02 Dec 2021 00:00:00 JST +09:00' }
    reading_checks { 'false' }
    remarks { 'test_meal' }
    user
  end

end