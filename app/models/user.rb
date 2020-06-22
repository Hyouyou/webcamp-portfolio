class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable,
	     :omniauthable, omniauth_providers:[:google_oauth2]


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

	def self.from_omniauth(access_token)
		#p access_token
		data = access_token.info
		user = User.where(email: data['email']).first
		#p user
		unless user
			user = User.create(name: data['name'],
				email: data['email'],
				password: Devise.friendly_token[0,20]
			)
		end
		user
	end
end
