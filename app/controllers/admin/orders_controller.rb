class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    if @order.status == "paid_up"
      @order_details.each do |order_detail|
        order_detail.making_status = "production_waiting"
        order_detail.save
      end 
    end  
    ##注文ステータスpaid_up、製作ステータスを全てproduction_waitingに更新する
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
