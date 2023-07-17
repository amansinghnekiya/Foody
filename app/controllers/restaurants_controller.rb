class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.all.order('created_at desc')
    end

    def new
        @restaurant = Restaurant.new
    end
    
    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.user_id = current_user.id

        if @restaurant.save
            redirect_to restaurants_path(), notice: "Restaurant created successfully"
        else 
            render :new, status: :unprocessable_entity 
        end
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def edit
        @restaurant = Restaurant.find(params[:id])
    end

    def update
        @restaurant = Restaurant.find(params[:id])

        if @restaurant.update(restaurant_params)
            redirect_to restaurants_path(), notice: "Restaurant updated successfully"
        else
            render :edit, status: :unprocessable_entity 
        end
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to restaurants_path(), notice: "Restaurant deleted successfully"
    end



      private
        def restaurant_params
            params.require(:restaurant).permit(:name, :description)
        end
     
end
