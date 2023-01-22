class Public::AddressesController < ApplicationController
  before_action :authentic_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
    
  end
end
