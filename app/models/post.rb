class Post < ApplicationRecord

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	attachment :post_image

	validates :title, presence: true
	validates :condition, presence: true
	validates :explanation, presence: true
	validates :selling_price, presence: true
	validates :is_burden, inclusion: [true, false]

	enum condition: {新品や未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5}

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
