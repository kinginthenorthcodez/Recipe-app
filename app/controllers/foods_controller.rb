class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    @user = current_user
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    Rails.logger.debug("My food: #{@food.inspect}")
    @food.save
    redirect_to user_foods_path(current_user)
  end

  def destroy
    Food.destroy(params[:user_id])
    redirect_back(fallback_location: user_foods_path)
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
