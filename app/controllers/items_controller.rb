class ItemsController < ApplicationController

    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @item = @restaurant.items.create(item_params)
        redirect_to restaurant_path(@restaurant), notice: "Item successfully added"
    end

    def destroy
        @restaurant = Restaurant.find(params[:restaurant_id])
        @item = @restaurant.items.find(params[:id])
        @item.destroy
        redirect_to restaurant_path(@restaurant), notice: "Item deleted successfully"
    end

    def edit
        @restaurant = Restaurant.find(params[:restaurant_id])
        @item = @restaurant.items.find(params[:id])  
    end

    def update 
        @restaurant = Restaurant.find(params[:restaurant_id])
        @item = @restaurant.items.find(params[:id])
        if @item.update(item_params)
            redirect_to restaurant_path(@restaurant), notice: "Item updated successfully"
        else
            render :edit, status: :unprocessable_entity 
        end
    end


     private
      def item_params
        params.require(:item).permit(:name, :price, :restaurant_id)
      end
end
