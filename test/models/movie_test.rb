require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "get movies" do
      movie = Movie.find(1)
      assert movie != nil
      assert_not movie.blank?
  end 
end
