class Post < ApplicationRecord

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	attachment :post_image

	validates :title, presence: true, length:{maximum: 30}
	validates :condition, presence: true, if: :is_status
	validates :explanation, presence: true, length:{maximum: 225}
	validates :selling_price, presence: true, if: :is_status
	validates :cycle, presence: true, unless: :is_status
	validates :is_burden, inclusion: [true, false]
	validates :is_status, inclusion: [true, false]

	enum condition: {新品や未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5}
	enum cycle: {リサイクル情報: 0, 買取店: 1, 寄付: 2, その他: 3}

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
