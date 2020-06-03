class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @order = Order.new
    @cart = Cart.find(params[:cart_id])
    @amount = Cart.find(params[:cart_id]).total_price
    @amount = @amount * 100
  end

  def create
    @cart_item_join = CartItemJoin.where(cart_id: params[:cart_id])
    @cart = Cart.find(params[:cart_id])
    @amount = Cart.find(params[:cart_id]).total_price
    @amount = @amount * 100

    if @amount != 0

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_i,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    @order = Order.new(user_id: current_user.id,
                        stripe_customer_id: customer.id)
      if @order.save

        @cart.items.each do |item|
          OrderItemJoin.create(item_id: item.id,
                            order_id: @order.id)
        end
        @cart_item_join.each do |ctj|
          ctj.destroy
        end
      end
      # Envoyer mail de confirmation à l'utilisateur et à l'admin
      @order.order_send
      @order.send_confirmation_to_admin
      flash[:success] = "Votre commande a été livrée par mail"
      redirect_to root_path

    else
      redirect_to root_path
    end

    rescue Stripe::CardError => e
    flash[:error] = e.message

  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end

end
