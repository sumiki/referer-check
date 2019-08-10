require 'test_helper'

class SendgridControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sendgrid_index_url
    assert_response :success
  end

end
