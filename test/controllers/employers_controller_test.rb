require 'test_helper'

class EmployersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employers_new_url
    assert_response :success
  end

end
