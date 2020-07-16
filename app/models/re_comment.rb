class ReComment < ApplicationRecord

	belongs_to :user
	belongs_to :re

	validates :comment, presence: true
end
