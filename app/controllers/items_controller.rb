class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def view
  end
end
