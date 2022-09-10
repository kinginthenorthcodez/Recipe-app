class InventoryFood < ApplicationRecord
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :inventory
  belongs_to :food, class_name: 'Food'
end
