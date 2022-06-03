require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get projects_index_url
    assert_response :success
  end

  test "should get get_project_from_jira" do
    get projects_get_project_from_jira_url
    assert_response :success
  end
end
