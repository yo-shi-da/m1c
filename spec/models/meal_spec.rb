require "rails_helper"

describe '検索とバリデーション', type: :system do

  
	# # OK
	describe '検索機能' do

    let!(:meal1) { FactoryBot.create(:meal,sugar_amount: '10', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name') }
    let!(:meal2) { FactoryBot.create(:meal,sugar_amount: '100', sugar_cube: '25', classification: '朝', image: File.open("#{Rails.root}/spec/factories/menu5.jpg"), start_time: 'Sat, 06 Nov 2021 00:00:00 JST +09:00', reading_checks: 'false', remarks: 'name')  }
    
		context 'Mealを検索したとき' do			
			it '特定のMealを表示できること' do
				expect(page)..to include(task)
			end
		end

	end

end