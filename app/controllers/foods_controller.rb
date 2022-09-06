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
    redirect_to foods_path(current_user)
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end