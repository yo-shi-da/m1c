require "rails_helper"

describe 'Meal_Model', type: :system do

	describe 'バリデーションテスト' do
    
		# OK
		context '糖質量が空白のとき' do			
			it 'バリデーションが通らない' do
				meal = Meal.new(sugar_amount: '', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name')
				expect(meal).not_to be_valid
			end
		end

		# OK
		context '全て入力されている場合' do			
			it 'バリデーションが通る' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
				meal = Meal.new(sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name', user_id: user1.id)
				expect(meal).to be_valid
			end
		end

		# OK
		context '糖質量が3文字以上の場合' do			
			it 'バリデーションが通らない' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
				meal = Meal.new(sugar_amount: '1000', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name', user_id: user1.id)
				expect(meal).not_to be_valid
			end
		end

		# OK
		context '糖質量が3文字以下の場合' do			
			it 'バリデーションが通る' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
				meal = Meal.new(sugar_amount: '1', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name', user_id: user1.id)
				expect(meal).to be_valid
			end
		end

		# OK
		context '角砂糖が3文字以上の場合' do			
			it 'バリデーションが通らない' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
				meal = Meal.new(sugar_amount: '10', sugar_cube: '1000', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name', user_id: user1.id)
				expect(meal).not_to be_valid
			end
		end

		# OK
		context '角砂糖が3文字以下の場合' do			
			it 'バリデーションが通る' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
				meal = Meal.new(sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name', user_id: user1.id)
				expect(meal).to be_valid
			end
		end

	end

end