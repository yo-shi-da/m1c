require "rails_helper"

describe 'GroupSystemTest', type: :system do

	describe 'Create&Read' do
		context 'Groupを作成したとき' do			
			it 'Groupの登録をできること' do
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

	describe 'Update' do
		context 'Groupを編集したとき' do			
			it 'Groupの編集をできること' do
        user = FactoryBot.create(:user, name: "user_group", email: "group@example.com", password: "password", password_confirmation: "password", admin: "false")
        group = FactoryBot.create(:group, name: "test_group", owner_id: user.id)
        FactoryBot.create(:member, user_id: user.id, group_id: group.id)		
        visit user_session_path
        fill_in :user_email, with: 'group@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
				visit groups_path
				click_link '編集'
        fill_in :group_name, with: 'test2_group'
				click_button '更新'
				expect(page).to have_content '更新しました。'
			end
		end
	end
	
	describe 'delete' do
		context 'Groupを削除したとき' do
			it 'Groupを削除をできること' do
				user = FactoryBot.create(:user, name: "user_group", email: "group@example.com", password: "password", password_confirmation: "password", admin: "false")
        group = FactoryBot.create(:group, name: "test_group", owner_id: user.id)
        FactoryBot.create(:member, user_id: user.id, group_id: group.id)
				visit user_session_path
        fill_in :user_email, with: 'group@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
				visit groups_path
				click_link '削除'
				page.driver.browser.switch_to.alert.accept
				expect(page).to have_content '削除しました。'
			end
		end
	end

end