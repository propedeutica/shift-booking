require 'test_helper'

class InformationControllerTest < ActionDispatch::IntegrationTest
  test 'should get Info' do
    get information_info_url
    assert_response :success
  end

  test 'should get root' do
    get root_url
    assert_response :success
  end
end
