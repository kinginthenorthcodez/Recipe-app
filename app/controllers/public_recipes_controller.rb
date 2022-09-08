class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(recipe_foods: [:food]).where(public: false).order(created_at: :desc)
  end

  def price_and_total_food(recipe_foods)
    recipe_price = 0
    recipe_foods.each do |recipe_food|
      recipe_price += recipe_food.food.price
    end
    recipe_price
  end

  helper_method :price_and_total_food
end
