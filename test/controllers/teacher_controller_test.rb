require 'test_helper'

class TeacherControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teacher_new_url
    assert_response :success
  end

  test "should get edit" do
    get teacher_edit_url
    assert_response :success
  end

  test "should get create" do
    get teacher_create_url
    assert_response :success
  end

  test "should get destroy" do
    get teacher_destroy_url
    assert_response :success
  end

  test "should get show" do
    get teacher_show_url
    assert_response :success
  end

end
