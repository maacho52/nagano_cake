class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
  end
end
