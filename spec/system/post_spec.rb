require "rails_helper"

RSpec.describe 'PostSystemTest', type: :system, js: true do

	describe 'Create&Read' do
		context 'Postを作成したとき' do			
			it 'Postの登録をできること' do
        meal = FactoryBot.create(:meal)
        group = FactoryBot.create(:group, name: "test_group", owner_id: meal.user_id)
        FactoryBot.create(:member, user_id: meal.user_id, group_id: group.id)
        visit user_session_path
        fill_in :user_email, with: 'test@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
        click_link '詳細'
				fill_in :post_owner_comment, with: 'test_post'
				fill_in :post_owner_sugar_amount, with: '10'
				fill_in :post_difference, with: '10'
				click_button '登録する'
				expect(page).to have_content '投稿しました。'
			end
		end
	end

	describe '既読機能' do
		context '既読ボタンを押したとき' do			
			it '未読が既読に変わっていること' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
				user2 = FactoryBot.create(:user, name: "user2", email: "user2@example.com", password: "password", password_confirmation: "password", admin: "false")
        meal1 = FactoryBot.create(:meal,
          sugar_amount: '10', 
          sugar_cube: '25', 
          classification: '朝', 
          image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), 
          start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', 
          reading_checks: 'false', 
          remarks: 'name', 
          user_id: user1.id
        ) 
        meal2 = FactoryBot.create(:meal,
          sugar_amount: '100', 
          sugar_cube: '25', 
          classification: '朝', 
          image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), 
          start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', 
          reading_checks: 'false', 
          remarks: 'name', 
          user_id: user2.id
        ) 				
        group = FactoryBot.create(:group, name: "test_group", owner_id: user1.id)
        FactoryBot.create(:member, user_id: user1.id, group_id: group.id)
        FactoryBot.create(:member, user_id: user2.id, group_id: group.id)
        visit user_session_path
        fill_in :user_email, with: 'user1@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
				visit member_all_path
				click_link 'user2'
				click_link '食事一覧へ'
				# binding.pry
        click_button '既読にする'
				expect(page).to have_content '既読'
			end
		end
	end

	describe 'グラフ機能' do
		context '食事を投稿したとき' do			
			it 'グラフが表示されていること' do
        meal = FactoryBot.create(:meal)
        group = FactoryBot.create(:group, name: "test_group", owner_id: meal.user_id)
        FactoryBot.create(:member, user_id: meal.user_id, group_id: group.id)
        visit user_session_path
        fill_in :user_email, with: 'test@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
				visit meal_graph_path(meal.user_id)
				expect(page).to have_content '日'
			end
		end
	end

end