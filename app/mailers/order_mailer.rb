class OrderMailer < ApplicationMailer
  default from: "admin@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.buyer.subject
  #
  def buyer(order)
    @order = order
    @buyer_email = User.find_by(id: order.user_id)&.email
    mail to: @buyer_email, subject: "Order Placed"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.seller.subject
  #
  def seller(order)
    @order = order
    @seller_email = @order.order_items.last.item.user.email
    mail to: @seller_email, subject: "Order Recieve"
  end
end
