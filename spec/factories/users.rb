FactoryBot.define do

  factory :user do
    name { 'test' }
    email { 'test@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { 'false' }
  end

end