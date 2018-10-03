require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Address", with: @order.address_id
    fill_in "Assigned Datetime", with: @order.assigned_datetime
    fill_in "Breadth", with: @order.breadth
    fill_in "Completed Datetime", with: @order.completed_datetime
    fill_in "Customer", with: @order.customer_id
    fill_in "Description", with: @order.description
    fill_in "Drone", with: @order.drone_id
    fill_in "Estimated Arrival", with: @order.estimated_arrival
    fill_in "Estimated Value", with: @order.estimated_value
    fill_in "Height", with: @order.height
    fill_in "Item Weight", with: @order.item_weight
    fill_in "Length", with: @order.length
    fill_in "Shipped Datetime", with: @order.shipped_datetime
    fill_in "Staff", with: @order.staff_id
    fill_in "Status", with: @order.status
    fill_in "Weight", with: @order.weight
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.address_id
    fill_in "Assigned Datetime", with: @order.assigned_datetime
    fill_in "Breadth", with: @order.breadth
    fill_in "Completed Datetime", with: @order.completed_datetime
    fill_in "Customer", with: @order.customer_id
    fill_in "Description", with: @order.description
    fill_in "Drone", with: @order.drone_id
    fill_in "Estimated Arrival", with: @order.estimated_arrival
    fill_in "Estimated Value", with: @order.estimated_value
    fill_in "Height", with: @order.height
    fill_in "Item Weight", with: @order.item_weight
    fill_in "Length", with: @order.length
    fill_in "Shipped Datetime", with: @order.shipped_datetime
    fill_in "Staff", with: @order.staff_id
    fill_in "Status", with: @order.status
    fill_in "Weight", with: @order.weight
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
