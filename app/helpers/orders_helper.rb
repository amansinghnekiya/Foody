module OrdersHelper
    def order_count_over_one
        @order.order_items.count > 0
    end
end
