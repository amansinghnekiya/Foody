class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart

  layout :set_layout

  private
   def set_layout
    if user_signed_in? && current_user&.role == "basic_account" || current_user&.role == "bussiness_account"
      "application"
    elsif !user_signed_in?
      "application"
    end
   end
end
