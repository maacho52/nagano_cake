class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @cart_item = Cart_item.new
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
    
    #if current_customer.cart_item.present?
    #カートが存在する場合、そうでない場合

  end

  def update
    @cart_item = Cart_item.find(params[:id])
    if @cart_item.update
       redirect_to cart_items_path
       #数量など更新された場合
    elsif
      #カート内商品がすべてなくなった場合

    end
  end

  def destroy

  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
