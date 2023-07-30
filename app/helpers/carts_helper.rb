module CartsHelper
  def cart_count_over_one
    @cart.order_items.count > 0
  end
end
