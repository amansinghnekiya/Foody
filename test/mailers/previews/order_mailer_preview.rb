# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/buyer
  def buyer
    OrderMailer.buyer
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/seller
  def seller
    OrderMailer.seller
  end

end
