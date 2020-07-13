class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :post
	belongs_to :re

	validates :comment, presence: true
end
