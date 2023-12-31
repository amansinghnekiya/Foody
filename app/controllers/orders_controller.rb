class OrdersController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def restaurant_orders
    @orders = Order.joins(order_items: :item).where(items: { user_id: current_user.id }).order(created_at: :desc).select('DISTINCT orders.*')
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
    
    if @order.save
      @cart.order_items.each do |item|
        @order.order_items << item
        @order.save
      end
      OrderMailer.buyer(@order).deliver_now
      OrderMailer.seller(@order).deliver_now
      MySidekiqJob.new.perform(current_user.id)
      session[:cart_id] = nil
      redirect_to root_path, notice: "Order Placed"
    else
      render :new, status: :unprocessable_entity 
    end
  end
      
  private
    def order_params
      params.require(:order).permit(:name, :email, :address)
    end

end
