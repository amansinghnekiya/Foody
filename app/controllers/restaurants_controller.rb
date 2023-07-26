class RestaurantsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

    def index
        @restaurants = Restaurant.order('created_at desc').page(params[:page]).per(3)
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
            redirect_to restaurant_path(@restaurant), notice: "Restaurant updated successfully"
        else
            render :edit, status: :unprocessable_entity 
        end
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to restaurants_path(), notice: "Restaurant destroyed successfully"
    end



      private
        def restaurant_params
            params.require(:restaurant).permit(:name, :description, :image)
        end
     
end
