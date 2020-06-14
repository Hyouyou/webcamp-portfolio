class Post < ApplicationRecord

	belongs_to :user
	has_many :comments, dependent: :destroy

	attachment :post_image

	enum condition: {新品や未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5}
end
