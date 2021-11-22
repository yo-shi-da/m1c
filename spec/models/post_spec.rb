require "rails_helper"

describe 'PostModelTest', type: :system do

	describe 'バリデーションテスト' do
    
		context '管理者からの糖質量が4文字以上の場合' do			
			it 'バリデーションが通らない' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
        meal = FactoryBot.create(:meal, sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name', user_id: user1.id)
        post = Post.new(owner_comment: 'OK',owner_sugar_amount: '1000000',difference: '10', meal_id: meal.id);
				expect(post).not_to be_valid
			end
		end

		context '管理者からの糖質量が4文字以下の場合' do			
			it 'バリデーションが通る' do
        user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
        meal = FactoryBot.create(:meal, sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name', user_id: user1.id)
        post = Post.new(owner_comment: 'OK',owner_sugar_amount: '1',difference: '10', meal_id: meal.id);
				expect(post).to be_valid
			end
		end

		context '差が4文字以上の場合' do			
			it 'バリデーションが通らない' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
        meal = FactoryBot.create(:meal, sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name', user_id: user1.id)
        post = Post.new(owner_comment: 'OK',owner_sugar_amount: '10',difference: '1000000000', meal_id: meal.id);
				expect(post).not_to be_valid
			end
		end

		context '差が4文字以下の場合' do			
			it 'バリデーションが通る' do
        user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
        meal = FactoryBot.create(:meal, sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name', user_id: user1.id)
        post = Post.new(owner_comment: 'OK',owner_sugar_amount: '10',difference: '10', meal_id: meal.id);
				expect(post).to be_valid
			end
		end

	end

end