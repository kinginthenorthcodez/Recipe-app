class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @user = current_user
  end

  def create
    @recipe = recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    Rails.logger.debug("My recipe: #{@recipe.inspect}")
    @recipe.save
    redirect_to recipes_path(current_user)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end