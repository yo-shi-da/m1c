require 'rails_helper'

RSpec.describe MealsController, type: :controller do

	describe 'CSV' do
		context 'csvをダウンロードしたとき' do
			before do
				get :export_csv, format: :csv
			end
			it 'ダウンロードできること' do
				expect(response.headers['Content-Type']).to include 'text/csv'
			end
		end
	end

end