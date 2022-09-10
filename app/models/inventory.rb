class Inventory < ApplicationRecord
  validates_presence_of :user
  validates :name, presence: true

  belongs_to :user
  has_many :inventory_foods, dependent: :destroy
end
