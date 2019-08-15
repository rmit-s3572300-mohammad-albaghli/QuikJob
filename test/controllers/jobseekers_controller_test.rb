require 'test_helper'

class JobseekersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get jobseekers_new_url
    assert_response :success
  end

end
