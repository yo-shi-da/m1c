require "rails_helper"

describe 'User_CRUDテスト', type: :system do

	# # # OK
	# describe 'Create&Read' do
	# 	context 'Userを作成したとき' do			
	# 		it 'ユーザの登録をできること' do
	# 			visit new_user_registration_path
	# 			fill_in :user_email, with: 'user_test@example.com'
	# 			fill_in :user_name, with: 'user_test'
	# 			fill_in :user_password, with: 'password'
	# 			fill_in :user_password_confirmation, with: 'password'
	# 			click_button 'アカウント登録'
	# 			expect(page).to have_content 'アカウント登録が完了しました。'
	# 		end
	# 	end
	# end

	# # # OK
	# describe 'Update' do
	# 	context 'Userを編集したとき' do			
	# 		it 'ユーザの編集をできること' do
  #       a = FactoryBot.create(:user) 
	# 			visit user_session_path
  #       fill_in :user_email, with: 'test@example.com'
  #       fill_in :user_password, with: 'password'
  #       click_button 'ログイン'
	# 			visit user_path(a.id)
	# 			click_link '編集'
	# 			fill_in :user_email, with: 'test2@example.com'
	# 			fill_in :user_name, with: 'test2'
	# 			fill_in :user_password, with: 'password'
	# 			fill_in :user_password_confirmation, with: 'password'
	# 			fill_in :user_current_password, with: 'password'
	# 			click_button '更新'
	# 			expect(page).to have_content 'アカウント情報を変更しました。'
	# 		end
	# 	end
	# end

	# # # OK
	# describe 'delete' do
	# 	context 'Userを削除したとき' do
	# 		it 'ユーザの削除をできること' do
	# 			a = FactoryBot.create(:user) 
	# 			visit user_session_path
  #       fill_in :user_email, with: 'test@example.com'
  #       fill_in :user_password, with: 'password'
  #       click_button 'ログイン'
	# 			visit user_path(a.id)
	# 			click_link '編集'
	# 			click_button 'アカウント削除'
	# 			page.driver.browser.switch_to.alert.accept
	# 			expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。'
	# 		end
	# 	end
	# end

	# # # OK
	# describe 'ゲストログイン機能' do
	# 	context 'ゲストログインボタンを押したとき' do
	# 		it 'ログインできること' do
	# 			visit root_path
  #       click_on 'ゲストログイン（閲覧用）'
	# 			expect(page).to have_content 'ゲストユーザーとしてログインしました'
	# 		end
	# 	end
	# end

	# # # OK
	# describe 'ゲストログイン機能（管理者）' do
	# 	context 'ゲストログインボタン（管理者）を押したとき' do
	# 		it 'ログイン（管理者）できること' do
	# 			visit root_path
  #       click_on 'ゲストログイン（管理者）'
	# 			expect(page).to have_content 'ゲスト管理者ユーザーとしてログインしました'
	# 		end
	# 	end
	# end

		# # OK
	# describe 'アクセス制限' do
	# 	context '他のUser画面に移動しようとしたとき' do
	# 		it '移動できないこと' do
	# 			user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
	# 			user2 = FactoryBot.create(:user, name: "user2", email: "user2@example.com", password: "password", password_confirmation: "password", admin: "false")
	# 			visit user_session_path
  #       fill_in :user_email, with: 'user1@example.com'
  #       fill_in :user_password, with: 'password'
  #       click_button 'ログイン'
	# 			visit user_path(user2.id)
	# 			expect(page).to have_content 'user1'
	# 		end
	# 	end
	# end

	# 	# # OK
	# describe 'ログアウト機能' do
	# 	context 'ログアウトボタンを押したしたとき' do
	# 		it 'ログアウトできること' do
	# 			a = FactoryBot.create(:user) 
	# 			visit user_session_path
  #       fill_in :user_email, with: 'test@example.com'
  #       fill_in :user_password, with: 'password'
  #       click_button 'ログイン'
  #       visit user_path(a.id)
  #       click_link 'ログアウト'
	# 			expect(page).to have_content 'ログアウトしました。'
	# 		end
	# 	end
	# end

end