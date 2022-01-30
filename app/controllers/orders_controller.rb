class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
  end

  def index
  end


  def show
  end


  def confirm
     binding.pry
  end


  def complete
  end

  private
  def order_params
    params.require(:order).permit(:address, :postal_code, :name)
  end
end
