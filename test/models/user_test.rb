require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  	test "create user1" do 
|		user= User.new(user:"test1", email:"test1@email.com")
	end

	test "same user1" do 
|		user= User.new(user:"test1", email:"test1@email.com")
		assert user.invaild?
	end
end
