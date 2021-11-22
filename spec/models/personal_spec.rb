require "rails_helper"

describe 'Personal_Model', type: :system do

	describe 'バリデーションテスト' do
    
		# OK
		context '1日あたりの目安摂取量が6文字以上の場合' do			
			it 'バリデーションが通らない' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
        personal = Personal.create(birth_date: 'Fri, 02 Mar 1956', height: '175', body_weight: '65', gender: '男', bmi: '22', waist_circumference: '80', hba_onec: '5', underlying_disease: "name", intake_per_oneday: '1000000000', remarks: "a", user_id: user1.id)
				expect(personal).not_to be_valid
			end
		end

		# OK
		context '1日あたりの目安摂取量が6文字以上の場合' do			
			it 'バリデーションが通る' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
        personal = Personal.create(birth_date: 'Fri, 02 Mar 1956', height: '175', body_weight: '65', gender: '男', bmi: '22', waist_circumference: '80', hba_onec: '5', underlying_disease: "name", intake_per_oneday: '1', remarks: "a", user_id: user1.id)
				expect(personal).to be_valid
			end
		end

	end

end