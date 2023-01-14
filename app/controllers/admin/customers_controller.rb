class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

    # 会員フルネーム
  def full_name
    self.last_name + " " + self.first_name
  end

  private

  def customer_params
    params.permit(:customer).require(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted )
  end
end
