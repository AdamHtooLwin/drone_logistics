require 'test_helper'

class NavLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nav_log = nav_logs(:one)
  end

  test "should get index" do
    get nav_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_nav_log_url
    assert_response :success
  end

  test "should create nav_log" do
    assert_difference('NavLog.count') do
      post nav_logs_url, params: { nav_log: { altitude: @nav_log.altitude, drone_id: @nav_log.drone_id, gps_latitude: @nav_log.gps_latitude, gps_longitude: @nav_log.gps_longitude } }
    end

    assert_redirected_to nav_log_url(NavLog.last)
  end

  test "should show nav_log" do
    get nav_log_url(@nav_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_nav_log_url(@nav_log)
    assert_response :success
  end

  test "should update nav_log" do
    patch nav_log_url(@nav_log), params: { nav_log: { altitude: @nav_log.altitude, drone_id: @nav_log.drone_id, gps_latitude: @nav_log.gps_latitude, gps_longitude: @nav_log.gps_longitude } }
    assert_redirected_to nav_log_url(@nav_log)
  end

  test "should destroy nav_log" do
    assert_difference('NavLog.count', -1) do
      delete nav_log_url(@nav_log)
    end

    assert_redirected_to nav_logs_url
  end
end
