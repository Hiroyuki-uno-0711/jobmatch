require 'test_helper'

class JobInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_informations_index_url
    assert_response :success
  end

  test "should get show" do
    get job_informations_show_url
    assert_response :success
  end

  test "should get new" do
    get job_informations_new_url
    assert_response :success
  end

  test "should get edit" do
    get job_informations_edit_url
    assert_response :success
  end

end
