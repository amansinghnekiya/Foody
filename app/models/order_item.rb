class OrderItem < ApplicationRecord
    belongs_to :item 
    belongs_to :cart
    

    def total_price
        item.price.to_i * quantity.to_i
    end
end
