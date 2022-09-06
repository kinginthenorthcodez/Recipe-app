class Inventory < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :inventory_foods

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
