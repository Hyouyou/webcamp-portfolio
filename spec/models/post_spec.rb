require 'rails_helper'

RSpec.describe Post, type: :model do
	let(:user){create(:user)}

	context"Postモデル/データが正しく表示される" do
		before do
			@post = Post.new
			@post.user = user
			@post.title = "test"
			@post.condition = "新品や未使用"
			@post.explanation = "test"
			@post.selling_price = 100
			@post.is_burden = true
		end
		it"全て入力してあるので保存される" do
			expect(@post).to be_valid
		end

		it"Postモデルのtitleが空でない" do
			@post.title = ""
			expect(@post).to be_invalid
			expect(@post.errors[:title]).to include("を入力してください")
		end

		it"Postモデルのtitleが30文字以上でない" do
			@post.title = "a"*31
			expect(@post).to be_invalid
			expect(@post.errors[:title]).to include("は30文字以内で入力してください")
		end

		it"Postモデルのexplanationが空でない" do
			@post.explanation = ""
			expect(@post).to be_invalid
			expect(@post.errors[:explanation]).to include("を入力してください")
		end

		it"Postモデルのexplanationが225文字以上でない" do
			@post.explanation = "a"*226
			expect(@post).to be_invalid
			expect(@post.errors[:explanation]).to include("は225文字以内で入力してください")
		end

		it"Postモデルのselling_priceが空でない" do
			@post.selling_price = ""
			expect(@post).to be_invalid
			expect(@post.errors[:selling_price]).to include("を入力してください")
		end
	end
end
