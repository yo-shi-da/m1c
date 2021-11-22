FactoryBot.define do

  factory :personal do
    birth_date { 'Fri, 02 Mar 1956' } 
    height { '175' }
    body_weight { '65' } 
    gender { '男' }
    bmi { '22' } 
    waist_circumference { '80' } 
    hba_onec { '5' }
    underlying_disease { "test" } 
    intake_per_oneday {'10' } 
    remarks  { "test" } 
    user
  end

end