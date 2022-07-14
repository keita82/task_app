require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get app" do
    get tasks_app_url
    assert_response :success
  end
end
