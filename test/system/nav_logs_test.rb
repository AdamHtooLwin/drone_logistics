require "application_system_test_case"

class NavLogsTest < ApplicationSystemTestCase
  setup do
    @nav_log = nav_logs(:one)
  end

  test "visiting the index" do
    visit nav_logs_url
    assert_selector "h1", text: "Nav Logs"
  end

  test "creating a Nav log" do
    visit nav_logs_url
    click_on "New Nav Log"

    fill_in "Altitude", with: @nav_log.altitude
    fill_in "Drone", with: @nav_log.drone_id
    fill_in "Gps Latitude", with: @nav_log.gps_latitude
    fill_in "Gps Longitude", with: @nav_log.gps_longitude
    click_on "Create Nav log"

    assert_text "Nav log was successfully created"
    click_on "Back"
  end

  test "updating a Nav log" do
    visit nav_logs_url
    click_on "Edit", match: :first

    fill_in "Altitude", with: @nav_log.altitude
    fill_in "Drone", with: @nav_log.drone_id
    fill_in "Gps Latitude", with: @nav_log.gps_latitude
    fill_in "Gps Longitude", with: @nav_log.gps_longitude
    click_on "Update Nav log"

    assert_text "Nav log was successfully updated"
    click_on "Back"
  end

  test "destroying a Nav log" do
    visit nav_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nav log was successfully destroyed"
  end
end
