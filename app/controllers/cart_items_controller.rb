class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_items = current_customer.cart_items
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
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

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end