class ItemsController < ApplicationController
  def index
    @items = Item.all
    anonymous = User.find_by(email: "anonymous@yopmail.com")
    @cart = anonymous.cart
  end

  def show
    @item = Item.find(params[:id])
  end

end
