class OrderItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :find_cart_and_order_item, only: [ :add_quantity, :reduce_quantity]
  before_action :authenticate_user!

  def new
    @order_item = OrderItem.new
  end

  def create
    item = Item.find(params[:item_id])

    begin
      @order_item = @cart.add_item(item)

      if @order_item.save
        redirect_to @order_item.cart, notice: 'Item added to cart.'
      else
        render :new
      end

    rescue Exception => e
      redirect_to root_path, notice: e.message
    end
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to cart_path(@cart), notice: 'Item successfully removed.'
  end

  def add_quantity
    @order_item.quantity += 1
    @order_item.save
    redirect_to cart_path(@cart)
  end
      
  def reduce_quantity
    if @order_item.quantity > 1
      @order_item.quantity -= 1
    else
      @order_item.destroy
    end

    @order_item.save
    redirect_to cart_path(@cart)
  end

  private
   def find_cart_and_order_item
     @cart = Cart.find(session[:cart_id])
     @order_item = OrderItem.find(params[:id])
   end

end
