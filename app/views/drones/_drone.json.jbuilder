json.extract! drone, :id, :name, :status, :carrying_capacity, :price, :acquired_date, :weight, :created_at, :updated_at
json.url drone_url(drone, format: :json)
