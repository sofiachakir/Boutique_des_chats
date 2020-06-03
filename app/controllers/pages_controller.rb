class PagesController < ApplicationController
  def profile
  	@user = current_user
  	@ordered_items = @user.orders
  end
end
