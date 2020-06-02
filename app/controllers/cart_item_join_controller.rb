class CartItemJoinController < ApplicationController

  def create
    CartItemJoin.create(item_id: params[:item_id],
                        cart: current_user.cart)
    redirect_to user_cart_path(current_user.id, current_user.cart.id)
  end
end
