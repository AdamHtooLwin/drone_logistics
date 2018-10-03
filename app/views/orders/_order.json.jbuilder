json.extract! order, :id, :completed_datetime, :address_id, :status, :weight, :customer_id, :staff_id, :drone_id, :assigned_datetime, :shipped_datetime, :estimated_arrival, :item_weight, :length, :breadth, :height, :estimated_value, :description, :created_at, :updated_at
json.url order_url(order, format: :json)
