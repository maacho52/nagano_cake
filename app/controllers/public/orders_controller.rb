class Public::OrdersController < ApplicationController

  def index
    @orders= current_customer.orders.all
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def check
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    #@total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
    @order = Order.new
    render check
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.price = cart_item.item.price
        order_detail.amount = cart_item.item.amount
        order_detail.item_id = cart_item.item_id
        order_detail.save
      end
      @cart_items.destroy_all
      redirect_to order_complete_path
    else
      render new
    end
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
    shipping_cost = 800
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    #params.require(:order).permit(:payment_method, :postal_code, :address, :name, :address_id,:select_address)
  end
end
