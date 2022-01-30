class OrdersController < ApplicationController

  def new
    @order = Order.find(params[:id])
  end

  def create
  end

  def index
  end


  def show
  end


  def confirm
  end


  def complete
  end
end
