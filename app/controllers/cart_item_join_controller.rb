class CartItemJoinController < ApplicationController
  before_action :authenticate_user!

  def create
    CartItemJoin.create(item_id: params[:item_id],
                        cart: current_user.cart)
    flash[:success] = "La photo a été ajoutée à votre panier"
    redirect_to user_cart_path(current_user.id, current_user.cart.id)
  end

  def destroy
  	@cart_item_join = CartItemJoin.find(params[:id])
  	@cart_item_join.destroy
    flash[:notice] = "La photo a été retirée de votre panier"
  	if current_user.cart.items.empty?
  		redirect_to root_path
  	else
  		redirect_to user_cart_path(current_user.id, current_user.cart.id)
  	end
  end
end
