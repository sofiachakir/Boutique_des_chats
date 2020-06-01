class ItemsController < ApplicationController
  def index
    @items = Item.all
    @user = User.find_by(email: "anonymous@yopmail.com")
    @cart = @user.cart
  end

  def show
    @item = Item.find(params[:id])
  end

end
