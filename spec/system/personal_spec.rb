require "rails_helper"

describe 'Personal_CRUDテスト', type: :system do

  # 共通化
  # before do
  #   personal_test = FactoryBot.create(:user)
  #   visit user_session_path
  #   fill_in :user_email, with: 'test@example.com'
  #   fill_in :user_password, with: 'password'
  #   click_button 'ログイン'
  # end

	# # OK
	describe 'Create&Read' do
		context 'Personalを作成したとき' do			
			it 'Personalを作成をできること' do
        # binding.pry
        personal_test = FactoryBot.create(:user)
        visit user_session_path
        fill_in :user_email, with: 'test@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
				visit personal_path(personal_test.id)
        click_link '新規作成'
        select '2021', from: 'personal_birth_date_1i'
        select '11', from: 'personal_birth_date_2i'
        select '21', from: 'personal_birth_date_3i'
        fill_in :personal_height, with: '175' 
        fill_in :personal_body_weight, with: '65' 
        select '男', from: 'personal_gender'
        fill_in :personal_bmi, with: '22'
        fill_in :personal_waist_circumference, with: '80' 
        fill_in :personal_hba_onec, with: '5' 
        fill_in :personal_underlying_disease, with: 'test' 
        fill_in :personal_intake_per_oneday, with: '10' 
        fill_in :personal_remarks, with: "test"
				click_button '登録する'
				expect(page).to have_content '作成しました。'
			end
		end
	end

	# OK
  # binding.pry
  # personal_test = FactoryBot.create(:user)
	describe 'Update' do
		context 'Personalを編集したとき' do			
			it 'Personalの編集をできること' do
        personal_test = FactoryBot.create(:personal)
        visit user_session_path
        fill_in :user_email, with: 'test@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
				visit personal_path(personal_test.user_id)
				click_link '編集'
				fill_in :personal_body_weight, with: '75'
				click_button '更新する'
				expect(page).to have_content '更新しました。'
			end
		end
	end

	# # # 不要
	# describe 'delete' do
	# 	context 'Personalを削除したとき' do
	# 		it 'Personalの削除をできること' do
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