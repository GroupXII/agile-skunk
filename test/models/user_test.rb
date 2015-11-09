require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "dummy", email: "dummy@example.com",
  					 password: "pass", password_confirmation: "pass")
  end

  test "authenticated? should return false for a user with nil digest" do
  	assert_not @user.authenticated?('')
  end


  	test "create user1" do 
		user= User.new(user:"test1", email:"test1@email.com")
	end

	test "same user1" do 
		user= User.new(user:"test1", email:"test1@email.com")
		assert user.invaild?
	end
	
end


  test "favourites testing" do
      user= User.new(user:"test3", email:"test3@email.com")
      @movie = Movie.find(1)
      user.favorite << @movie
      
      assert response :success
  end 