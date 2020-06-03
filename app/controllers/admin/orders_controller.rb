class Admin::OrdersController < ApplicationController
	before_action :check_if_admin
	
	def index
		@orders = Order.all
	end

end