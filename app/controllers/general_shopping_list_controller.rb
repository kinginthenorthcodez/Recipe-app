class GeneralShoppingListController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
    @recipe_food = RecipeFood.find_by(id: params[:recipe_id])
    @inventory_food = InventoryFood.find_by(id: params[:inventory_id])

    @missing_foods = []
    @quantity = 0
    @price = 0
    @total_price = 0
    @foods.each do |food|
      next unless food.id != InventoryFood.where(food_id: food.id) || RecipeFood.where(food_id: food.id)

      @missing_foods.push(food)
      inventory_food = InventoryFood.where(food_id: food.id).sum(:quantity)
      recipe_food = RecipeFood.where(food_id: food.id).sum(:quantity)
      @quantity = inventory_food - recipe_food
      @price = food.price * @quantity
      @total_price += @price
    end
  end

  def new; end

  def create; end
end
