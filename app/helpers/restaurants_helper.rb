module RestaurantsHelper
  def restaurant_author(restaurant)
	user_signed_in? && current_user.id == restaurant.user_id
  end
end
