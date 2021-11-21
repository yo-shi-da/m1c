require "rails_helper"

describe 'Post_CRUDテスト', type: :system do

	# # OK
	describe 'Create&Read' do
		context 'Postを作成したとき' do			
			it 'Postの登録をできること' do
        group_test = FactoryBot.create(:user)
        visit user_session_path
        fill_in :user_email, with: 'test@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
				visit groups_path
        click_link '新規作成'
				fill_in :group_name, with: 'test_group'
				click_button '登録する'
				expect(page).to have_content '作成しました。'
			end
		end
	end

	# # # OK
	# describe 'Update' do
	# 	context 'Groupを編集したとき' do			
	# 		it 'Groupの編集をできること' do
  #       # FactoryBot.create(:user)
  #       # FactoryBot.create(:group)
  #       FactoryBot.create(:member)
  #       # user = FactoryBot.create(:user, name: "user_group", email: "group@example.com", password: "password", password_confirmation: "password", admin: "false")
  #       # group = FactoryBot.create(:group, name: "test_group", owner_id: user.id)
  #       # FactoryBot.create(:member, user_id: user.id, group_id: group.id)
  #       visit user_session_path
  #       fill_in :user_email, with: 'test@example.com'
  #       fill_in :user_password, with: 'password'
  #       click_button 'ログイン'
	# 			visit groups_path
  #       # binding.pry
	# 			click_link '編集'
  #       fill_in :group_name, with: 'test2_group'
	# 			click_button '更新'
	# 			expect(page).to have_content '更新しました。'
	# 		end
	# 	end
	# end

	# # # OK
	# describe 'delete' do
	# 	context 'Groupを削除したとき' do
	# 		it 'Groupを削除をできること' do
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

end