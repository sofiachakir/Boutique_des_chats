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
    @item = Item.find(params[:id])
    @item.update(up_params)

      redirect_to admin_items_path
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to admin_items_path
  end

  private

  def item_params
    params.permit(:title, :description, :price, :picture)
  end

  def up_params
    params.require(:item).permit(:title, :description, :price)
  end

end
