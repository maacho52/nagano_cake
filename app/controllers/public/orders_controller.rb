class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def check
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
  end
  
  def create
    @cart_item = Cart_item.find(params[:id])
  end
  
  private 
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status)
  end
end
