class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    p @order
    if @order.save
      cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.item_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.amount
      order_detail.purchase_price = cart.item.price
      order_detail.save
    end
      redirect_to orders_complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = current_customer.orders
  end


  def show
    @order = Order.find(params[:id])
  end


  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment = params[:order][:payment]
    @order.postage = 800
    if params[:order][:select_address] == "0"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    end
       @cart_items = current_customer.cart_items
  end


  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name, :postage, :pay, :customer_id)
  end
end
