class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    @all_items = @cart.items
  end

end
