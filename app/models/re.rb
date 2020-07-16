class Re < ApplicationRecord

	belongs_to :user
	has_many :re_comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	attachment :re_image

	validates :title, presence: true, length:{maximum: 30}
	validates :cycle, presence: true
	validates :content, presence: true

	enum cycle: {リサイクル情報: 0, 買取店: 1, 寄付: 2, その他: 3}

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
