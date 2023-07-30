class ItemsController < ApplicationController
  before_action :set_restaurant
  before_action :authenticate_user!

  def show
    @items = @restaurant.items
  end

  def new
    @item = @restaurant.items.build
  end

  def create
    @item = @restaurant.items.build(item_params)
    @item.user_id = current_user.id

    if @item.save
      redirect_to restaurant_path(@restaurant), notice: "Item successfully added"
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def destroy
    @item = @restaurant.items.find(params[:id])
    @item.destroy
    redirect_to restaurant_path(@restaurant), notice: "Item destroyed successfully"
  end

  def edit
    @item = @restaurant.items.find(params[:id])  
  end

  def update 
    @item = @restaurant.items.find(params[:id])

    if @item.update(item_params)
      redirect_to restaurant_path(@restaurant), notice: "Item updated successfully"
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  private
   def set_restaurant
     @restaurant = Restaurant.find(params[:restaurant_id])
   end
   
   def item_params
     params.require(:item).permit(:name, :price, :restaurant_id, :image)
   end

end
