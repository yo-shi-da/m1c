require "rails_helper"

describe 'Meal_CRUDテスト' do

  # OK
  describe 'Create' do
    context 'Mealを作成したとき' do			
      it '作成したMealが表示される。' do
        FactoryBot.create(:user, name: "user_meal", email: "meal@example.com", password: "password", password_confirmation: "password", admin: "false")
        # FactoryBot.create(:meal, sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/public/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false',remarks: 'name', user_id: 1 )
        visit user_session_path
        fill_in :user_email, with: 'meal@example.com'
        fill_in :user_password, with: 'password'
        click_button 'ログイン'
        click_link '食事投稿'
        fill_in :meal_sugar_amount, with: '1'
        fill_in :meal_sugar_cube, with: '1'
        select '朝', from: 'meal_classification'
        fill_in :meal_start_time, with: '2021-11-20'      
        fill_in :meal_remarks, with: 'test'      
        attach_file 'meal_image', "#{Rails.root}/spec/factories/menu5.jpg"
        # binding.pry
        click_button '登録する'
        expect(page).to have_content "作成しました"
      end
    end
  end

  describe '' do
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
        fill_in :meal_start_time, with: '2021-11-20'      
        fill_in :meal_remarks, with: 'test'      
        attach_file 'meal_image', "#{Rails.root}/spec/factories/menu5.jpg"
        # binding.pry
        click_button '登録する'
        expect(page).to have_content "作成しました"
      end
    end
  end


end