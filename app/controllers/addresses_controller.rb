class AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def edit

  end

  def destroy

  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
