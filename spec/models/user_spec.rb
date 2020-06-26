require 'rails_helper'

RSpec.describe User, type: :model do

	context"Userモデル/データが正しく表示される" do
		before do
			@user = User.new
			@user.name = "test"
			@user.email = "test@example.com"
			@user.profile = "test"
			@user.password = "password"
		end

		it"全て入力されているので保存される" do
			expect(@user).to be_valid
		end

		it"Userモデルのnameが空でない" do
			@user.name = ""
			expect(@user).to be_invalid
			expect(@user.errors[:name]).to include("を入力してください")
		end

		it"Userモデルのnameが20文字以上でない" do
			@user.name = "a"*21
			expect(@user).to be_invalid
			expect(@user.errors[:name]).to include("は20文字以内で入力してください")
		end

		it"Userモデルのemailが空でない" do
			@user.email = ""
			expect(@user).to be_invalid
			expect(@user.errors[:email]).to include("を入力してください")
		end

		it"Userモデルのprofileが225文字以上でない" do
			@user.profile = "a"*226
			expect(@user).to be_invalid
			expect(@user.errors[:profile]).to include("は225文字以内で入力してください")
		end
	end
end
