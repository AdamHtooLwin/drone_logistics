class Order < ApplicationRecord
  belongs_to :address
  belongs_to :customer
  belongs_to :staff, optional: true
  belongs_to :drone, optional: true
end
