class Food < ApplicationRecord
  has_many :inventory_foods, foreign_key: 'food_id'
  has_many :recipe_foods, foreign_key: 'food_id'

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validate :price_is_valid_decimal_precision

  private

  def price_is_valid_decimal_precision
    return unless price != price.to_f.round(2)

    errors.add(:price,
               'The price of the product is invalid.
                  There should only be two digits at most after the decimal point.')
  end
end
