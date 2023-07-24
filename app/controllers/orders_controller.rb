class OrdersController < ApplicationController
    #after_action :temp, only: [:create]
    def index
        @orders = current_user.orders
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        @order.user_id = current_user.id
        @order.save
        @cart.order_items.each do |item|
            @order.order_items << item
            @order.save
        end
        OrderMailer.buyer(@order).deliver_now
        OrderMailer.seller(@order).deliver_now
        session[:cart_id] = nil
        redirect_to root_path, notice: "Order Placed"
    end
      
     private
      def order_params
        params.require(:order).permit(:name, :email, :address)
      end
end
