FactoryBot.define do

  factory :member do
    association :group_id, factory: :group
    association :user_id, factory: :user
  end

end