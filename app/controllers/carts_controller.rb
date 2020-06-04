class CartsController < ApplicationController
	before_action :authenticate_user, only: [:show]

  def show
    @cart = Cart.find(params[:id])
    @all_items = @cart.items
  end

  private

  def authenticate_user
    unless current_user.id == Cart.find(params[:id]).user_id
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end
end
