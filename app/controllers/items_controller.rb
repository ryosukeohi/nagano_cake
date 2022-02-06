class ItemsController < ApplicationController

  def index
     @items = Item.page(params[:page]).reverse_order
     @count = Item.count
  end


  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @customer = current_customer.id
  end

end