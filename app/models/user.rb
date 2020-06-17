class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable

	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	attachment :user_image

	validates :name, presence: true
	validates :email, presence: true

	def soft_delete
		update_attribute(:deleted_at, Time.current)
	end

	def active_for_authentication?
		super && !deleted_at
	end

	def inactive_message
		!deleted_at ? super : :deleted_account
	end
end
