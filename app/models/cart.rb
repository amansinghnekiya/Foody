class Cart < ApplicationRecord
    has_many :order_items, dependent: :destroy
    has_many :items, through: :order_items

    def add_item(item)
        current_item = order_items.find_by(item_id: item.id)
        if current_item
          current_item.increment(:quantity)
        else
          current_item = order_items.build(item_id: item.id)
        end
        current_item
    end

    def total_price
        order_items.to_a.sum { |item| item.total_price }
    end

end
