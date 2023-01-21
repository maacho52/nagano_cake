class Public::CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
