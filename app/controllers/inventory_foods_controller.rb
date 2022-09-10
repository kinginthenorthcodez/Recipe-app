class InventoryFoodsController < ApplicationController
  before_action :set_foods, only: [:new]

  def new
    @inventory_foods = InventoryFood.new
    @foods = Food.where(user_id: current_user)
    @data = @foods.map(&:id)
    @inventory = Inventory.where(id: params[:inventory_id])
    @inventory_id = @inventory.map(&:id)
    respond_to do |format|
      format.html do
        render :new, locals: { inventory_foods: @inventory_foods }
      end
    end
  end

  def create
    data = inventory_food_params
    @food = Food.find_by(id: data[:food_id])
    @inventory = Inventory.find_by(id: data[:inventory_id])
    @inventory_food = InventoryFood.new(quantity: data[:quantity], food: @food, inventory: @inventory)

    if @inventory_food.save
      flash[:notice] = 'Inventory food created!'
      redirect_to user_inventories_path
    else
      flash[:notice] = 'failed to create inventory food!'
      render :new, locals: { inventory_foods: @inventory_foods }
    end
  end

  def destroy
    @inventory_food = InventoryFood.find_by(inventory_id: params[:id])
    if @inventory_food.destroy
      flash[:success] = 'inventory_food Successfully deleted!'
    else
      flash.now[:error] = 'Error: could not delete inventory_food!'
    end
    redirect_to user_inventories_path(current_user)
  end

  private

  def inventory_food_params
    params.require(:inventory_foods).permit(:quantity, :inventory_id, :food_id)
  end

  def set_foods
    @foods = Food.all
  end
end
