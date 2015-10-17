class User < ActiveRecord::Base
	validates :name, :email, uniqueness: true
	has_secure_password
end
