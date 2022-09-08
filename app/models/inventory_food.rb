class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food, class_name: 'Food'
end
