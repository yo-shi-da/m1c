require "rails_helper"

RSpec.describe 'PostSystemTest', type: :system, js: true do

	# describe 'Create&Read' do
	# 	context 'Postを作成したとき' do			
	# 		it 'Postの登録をできること' do
  #       meal = FactoryBot.create(:meal)
  #       group = FactoryBot.create(:group, name: "test_group", owner_id: meal.user_id)
  #       FactoryBot.create(:member, user_id: meal.user_id, group_id: group.id)
  #       visit user_session_path
  #       fill_in :user_email, with: 'test@example.com'
  #       fill_in :user_password, with: 'password'
  #       click_button 'ログイン'
  #       click_link '詳細'
	# 			fill_in :post_owner_comment, with: 'test_post'
	# 			fill_in :post_owner_sugar_amount, with: '10'
	# 			fill_in :post_difference, with: '10'
	# 			click_button '登録する'
	# 			expect(page).to have_content '投稿しました。'
	# 		end
	# 	end
	# end

	# describe '既読機能' do
	# 	context '既読ボタンを押したとき' do			
	# 		it '未読が既読に変わっていること' do
  #       meal = FactoryBot.create(:meal)
  #       group = FactoryBot.create(:group, name: "test_group", owner_id: meal.user_id)
  #       FactoryBot.create(:member, user_id: meal.user_id, group_id: group.id)
  #       visit user_session_path
  #       fill_in :user_email, with: 'test@example.com'
  #       fill_in :user_password, with: 'password'
  #       click_button 'ログイン'
  #       click_button '既読にする'
	# 			visit meals_path
	# 			expect(page).to have_content '既読'
	# 		end
	# 	end
	# end

	# describe 'グラフ機能' do
	# 	context '食事を投稿したとき' do			
	# 		it 'グラフが表示されていること' do
  #       meal = FactoryBot.create(:meal)
  #       group = FactoryBot.create(:group, name: "test_group", owner_id: meal.user_id)
  #       FactoryBot.create(:member, user_id: meal.user_id, group_id: group.id)
  #       visit user_session_path
  #       fill_in :user_email, with: 'test@example.com'
  #       fill_in :user_password, with: 'password'
  #       click_button 'ログイン'
	# 			visit meal_graph_path(meal.user_id)
	# 			expect(page).to have_content '日'
	# 		end
	# 	end
	# end

end