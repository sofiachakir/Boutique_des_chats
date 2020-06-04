class CartsController < ApplicationController
	before_action :authenticate_user!
  #before_action :authenticate_user_and_cart, only: [:show]

  def show
    @cart = current_user.cart
    @all_items = @cart.items
  end

  private

  # def authenticate_user_and_cart
  #   unless current_user.id == Cart.find(params[:id]).user_id
  #     flash[:danger] = "Not logged in."
  #     redirect_to root_path
  #   end
  # end
end
