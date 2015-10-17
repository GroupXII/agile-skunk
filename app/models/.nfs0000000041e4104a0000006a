class User < ActiveRecord::Base

	validates :password_digest, confirmation: true
	validates :password_digest_confirmation, presence: true
	validates :name, :email, presence: true
	
end
