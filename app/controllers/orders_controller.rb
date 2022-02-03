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
    @order.postage = 800
    @order.pay = 0
    if @order.select_address = 0
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.first_name + current_customer.last_name
       @order.save
    elsif @order.select_address = 1
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
       @order.save
    else
      @order.save
    end  
       @cart_items = current_customer.cart_items
       redirect_to orders_complete_path
  end


  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :name)
  end
end
