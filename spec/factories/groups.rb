FactoryBot.define do

  factory :group do
    name { 'test_group' }
    # owner_id factory: :user
    association :owner_id, factory: :user
  end

end