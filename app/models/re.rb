class Re < ApplicationRecord

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	belongs_to :user

	attachment :re_image

	validates :title, presence: true, length:{maximum: 30}
	validates :cycle, presence: true
	validates :content, presence: true

	enum cycle: {リサイクル情報: 0, 買取店: 1, 寄付: 2, その他: 3}
end
