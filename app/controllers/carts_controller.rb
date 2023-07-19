class CartsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
    before_action :set_cart, only: [:show, :destroy]
    
    def show
    end

    def new
        @cart = Cart.new
    end

    def create
        byebug
        @cart = Cart.new(cart_params)
        if @cart.save
            redirect_to cart_url(@cart), notice: 'Cart was successfully created.'
        else
            render :new
        end
    end


    def destroy
        @cart.destroy if @cart.id == session[:cart_id]
        session[:cart_id] = nil
        redirect_to root_path, notice: 'Cart was successfully destroyed.' 
    end

    private
    
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
        params.fetch(:cart, {})
    end

    def invalid_cart
        logger.error "Attempt to access invalid cart #{params[:id]}"
        redirect_to root_path, notice: "that cart doesn't exist"
    end
end
