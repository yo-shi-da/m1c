require "rails_helper"

describe 'Post_CRUDテスト', type: :system do

	# # OK
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

end