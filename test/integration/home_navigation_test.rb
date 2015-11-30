require 'test_helper'

class HomeNavigationTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "correct navigation and routing" do
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", movies_path
    assert_select "a[href=?]", forums_path
  end
  
  test "correct GET root parse" do
    get root_path
    assert_template 'static_pages/home'
  end
end
