class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    render :new and return if params[:back] || !@order.save
    redirect_to @order
  end

  def index
  end


  def show
  end


  def confirm
    @order = Order.new(order_params)
    render :new if @order.invalid?
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @cart_items = current_customer.cart_items
  end


  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name)
  end
end
