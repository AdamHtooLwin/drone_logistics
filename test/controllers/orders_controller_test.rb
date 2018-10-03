require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address_id: @order.address_id, assigned_datetime: @order.assigned_datetime, breadth: @order.breadth, completed_datetime: @order.completed_datetime, customer_id: @order.customer_id, description: @order.description, drone_id: @order.drone_id, estimated_arrival: @order.estimated_arrival, estimated_value: @order.estimated_value, height: @order.height, item_weight: @order.item_weight, length: @order.length, shipped_datetime: @order.shipped_datetime, staff_id: @order.staff_id, status: @order.status, weight: @order.weight } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address_id: @order.address_id, assigned_datetime: @order.assigned_datetime, breadth: @order.breadth, completed_datetime: @order.completed_datetime, customer_id: @order.customer_id, description: @order.description, drone_id: @order.drone_id, estimated_arrival: @order.estimated_arrival, estimated_value: @order.estimated_value, height: @order.height, item_weight: @order.item_weight, length: @order.length, shipped_datetime: @order.shipped_datetime, staff_id: @order.staff_id, status: @order.status, weight: @order.weight } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
