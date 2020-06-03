class PagesController < ApplicationController
  def profile
  	@user = current_user
  	@orders = @user.orders
  end
end
