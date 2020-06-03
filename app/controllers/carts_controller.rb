class CartsController < ApplicationController
	before_action :authenticate_user!

  def show
    @cart = Cart.find(params[:id])
    @all_items = @cart.items
  end

end
