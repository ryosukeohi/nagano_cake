class AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def edit

  end

  def destroy
   @address = Address.find(params[:id])
   @address.destroy
   redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end
end
