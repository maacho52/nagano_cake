class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details

    if @order.order_status == "paid_up"
      @order_details.each do |order_detail|
        order_detail.making_status = "production_waiting"
        order_detail.save
      end
    end
    ##↑注文ステータスpaid_up、製作ステータスを全てproduction_waitingに更新する

    @order_details.each do |order_detail|
      if order_detail.making_status == "production_making"
        @order.order_status = "making"
        @order.save
      end
      ## 製作ステータスmaking、注文ステータスをproduction_makingに更新

      ## 紐付いている注文商品の製作ステータスが "すべて" completedになったとき、注文ステータスをpreparingに更新させたい
      ## 紐付いている注文商品の製作ステータスを一つ一つeach文で確認
      if order_detail.making_status != "completed" ## 製作ステータスcompletedではない場合
         @order.order_status = "making"
         @order.save
      end

    end



    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
