require "rails_helper"

describe 'MealSystemTest' do

  describe 'Create&Read' do
    context 'Mealを作成したとき' do			
      it '作成したMealが表示される。' do
        FactoryBot.create(:user, name: "user_meal", email: "meal@example.com", password: "password", password_confirmation: "password", admin: "false")
        visit user_session_path
        fill_in :user_email, with: 'meal@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
        click_link '食事投稿'
        fill_in :meal_sugar_amount, with: '1'
        fill_in :meal_sugar_cube, with: '1'
        select '朝', from: 'meal_classification'
        fill_in :meal_start_time, with: '2020-12-01'      
        fill_in :meal_remarks, with: 'test'      
        attach_file 'meal_image', "#{Rails.root}/spec/factories/menu5.jpg"
        click_button '登録する'
        expect(page).to have_content "作成しました"
      end
    end
  end

  describe 'Update' do
    context 'Mealを編集したとき' do			
      it '編集されたMealが表示される。' do
        FactoryBot.create(:meal) 
        visit user_session_path
        fill_in :user_email, with: 'test@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
        click_link '編集'
        fill_in :meal_sugar_amount, with: '100'
        click_button '更新する'
        expect(page).to have_content "更新しました"
      end
    end
  end
  
  describe 'Delete' do
    context 'Mealを削除したとき' do			
      it 'Mealが削除される。' do
        FactoryBot.create(:meal) 
        visit user_session_path
        fill_in :user_email, with: 'test@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
        click_link '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "削除しました"
      end
    end
  end

  describe 'Update' do
    context 'Mealを作成したとき' do			
      it '作成されたMealがカレンダーに表示される。' do
        meal = FactoryBot.create(:meal) 
        visit user_session_path
        fill_in :user_email, with: 'test@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
        visit meal_calendar_path(meal.user_id)
        expect(page).to have_link "100"
      end
    end
  end

  describe 'お気に入り機能' do
    context 'お気に入りボタンを押したとき' do			
      it '自分のお気に入りページに表示される' do
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
        visit user_session_path
        fill_in :user_email, with: 'user2@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
        visit home_path(meal1.id)
        click_link 'お気に入り'
        expect(page).to have_content "お気に入り登録しました"
      end
    end
  end

  describe '検索機能' do
    context '検索ボタンを押したとき' do			
      it '特定のMealが表示される' do
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
        visit user_session_path
        fill_in :user_email, with: 'user2@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
        fill_in 'q_sugar_amount_gteq', with: '100'
        fill_in 'q_sugar_amount_lteq', with: '100'
        click_on '検索'
        expect(page).to have_content "100"
      end
    end
  end  
  
end