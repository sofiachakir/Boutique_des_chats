class CartItemJoinController < ApplicationController

  def create
    CartItemJoin.create(item_id: params[:item_id],
                        cart: current_user.cart)
    redirect_to user_cart_path(current_user.id, current_user.cart.id)
  end

  def destroy
  	@cart_item_join = CartItemJoin.find(params[:id])
  	@cart_item_join.destroy
  	if current_user.cart.items.empty?
  		redirect_to root_path
  	else
  		redirect_to user_cart_path(current_user.id, current_user.cart.id)
  	end
  end
end
