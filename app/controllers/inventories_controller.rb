class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all.where(user_id: current_user.id)
  end

  def new
    @inventory = Inventory.new
    respond_to do |format|
      format.html do
        render :new, locals: { inventory: @inventory }
      end
    end
  end

  def show
    @inventory = Inventory.find_by(id: params[:id])
  end

  def create
    data = inventory_params
    respond_to do |format|
      format.html do
        inventory = Inventory.new(name: data[:name], user: current_user, description: data[:description])
        if inventory.save
          flash[:notice] = 'Inventory successfully created!'
          redirect_to user_inventories_path(current_user)
        else
          flash[:error] = 'Error:failed to create inventory'
          render :new, locals: { inventory: @inventory }
        end
      end
    end
  end

  def destroy
    inventory = Inventory.find_by(id: params[:id])
    if inventory.destroy
      respond_to do |format|
        format.html do
          flash[:notice] = 'Inventory removed!'
          redirect_to user_inventories_path
        end
      end
    else
      flash.now[:error] = 'Error: failed to remove inventory!'
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
