class Admin::ItemsController < ApplicationController
  before_action :check_if_admin

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update

  end

  def new
    @item = Item.new
  end

  def create

  end

  def destroy
     @item = Item.find(params[:id])
     @item.destroy
     redirect_to admin_root_path
  end

end
