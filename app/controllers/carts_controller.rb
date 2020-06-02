class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    @all_items = @cart.items
  end


  def update
    @cart = Cart.find(params[:id])
    puts "+"*60
    puts params
  end

end
