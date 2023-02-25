class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    
    ## 製作ステータスproduction_making、注文ステータスをmakingに更新
    if @order_detail.making_status == "production_making"
      @order.order_status = "making"
      @order.save
    end


        ## 製作ステータスが全てcompletedになったとき、注文ステータスpreparingに更新
    if @order.order_details.count == @order.order_details.where(making_status: 3).count
        @order.order_status = "preparing"
        @order.save
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
