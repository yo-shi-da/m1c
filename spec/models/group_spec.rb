require "rails_helper"

describe 'GroupModelTest', type: :system do

	describe 'バリデーションテスト' do
    
		context 'グループ名が255文字以上の場合' do			
			it 'バリデーションが通らない' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
				group = Group.new(name: '11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', owner_id: user1.id)
				expect(group).not_to be_valid
			end
		end

		context 'グループ名が255文字以下の場合' do			
			it 'バリデーションが通る' do
				user1 = FactoryBot.create(:user, name: "user1", email: "user1@example.com", password: "password", password_confirmation: "password", admin: "false")
        group = Group.new(name: '1', owner_id: user1.id)
				expect(group).to be_valid
			end
		end

	end

end