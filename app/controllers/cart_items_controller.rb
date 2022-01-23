class CartItemsController < ApplicationController
  def index
    @cart_items = CartItems.find(current_customer.id)
  end

  def uodate
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def clear
  end

  def destroy
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :about)
  end
end