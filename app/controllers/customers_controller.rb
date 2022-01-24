class CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
    @customer.save(customer_params)
  end

  def update
  end

  def confirm
    @customer = Customer.find_by(name: params[:name])
  end

  def withdraw
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end


private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
