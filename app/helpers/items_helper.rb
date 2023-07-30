module ItemsHelper
  def item_author(item)
	user_signed_in? && current_user.id == item.user_id
  end
end
