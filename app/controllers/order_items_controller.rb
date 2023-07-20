class OrderItemsController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:create]

    # def create
    #     chosen_item = Item.find(params[:item_id])
    #     current_cart = @current_cart
      
    #     if current_cart.items.include?(chosen_item)
    #       @order_item = current_cart.order_items.find_by(:item_id => chosen_item)
    #       @order_item.quantity += 1
    #     else
    #       @order_item = OrderItem.new
    #       @order_item.cart_id = current_cart
    #       @order_item.item_id = chosen_item
    #     end
    #     @order_item.save
    #     redirect_to cart_path(current_cart)
    # end

    def new
        @order_item = OrderItem.new
    end

    def create
        item = Item.find(params[:item_id])
        @order_item = @cart.add_item(item)
        if @order_item.save
            redirect_to @order_item.cart, notice: 'Item added to cart.'
        else
            render :new
        end
    end

    def destroy
        @cart = Cart.find(session[:cart_id])
        @order_item = OrderItem.find(params[:id])
        @order_item.destroy
        redirect_to cart_path(@cart), notice: 'Item successfully removed.'
    end

    def add_quantity
        @cart = Cart.find(session[:cart_id])
        @order_item = OrderItem.find(params[:id])
        @order_item.quantity += 1
        @order_item.save
        redirect_to cart_path(@cart)
    end
      
    def reduce_quantity
        @cart = Cart.find(session[:cart_id])
        @order_item = OrderItem.find(params[:id])
        if @order_item.quantity > 1
          @order_item.quantity -= 1
        else
            @order_item.destroy
        end
        @order_item.save
        redirect_to cart_path(@cart)
    end


end
