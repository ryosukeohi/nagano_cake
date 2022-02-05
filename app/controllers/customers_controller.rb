class CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_show_path(current_customer.id)
  end

  def confirm
    @customer = Customer.find_by(email: params[:email])
  end

  def withdraw
    @customer = Customer.find_by(email: params[:email])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end


private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
