require 'rails_helper'

RSpec.describe Comment, type: :model do
	context"Commentモデル/データが正しく表示される" do
		it"Commentモデルのcommentが空でない" do
			comment = Comment.new
			comment.comment = ""
			expect(comment).to be_invalid
			expect(comment.errors[:comment]).to include("を入力してください")
		end
	end
end
