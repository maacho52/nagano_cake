class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    #@cart_item = Cart_item.new
    #@total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    #@item = Item.find(params[:id])
    @total = 0
  end

  def create
    #binding.pry
    #@item = Item.find(cart_item_params[:item_id])
    @cart_item = current_customer.cart_items.new(cart_item_params)

    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
       cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       cart_item.amount += params[:cart_item][:amount].to_i
       cart_item.save
       redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
    #if current_customer.cart_item.present?
      ##1. 追加した商品がカート内に存在するかの判別
    ##存在した場合
      ##2. カート内の個数をフォームから送られた個数分追加する
    ##存在しなかった場合
      ##カートモデルにレコードを新規作成する

  end

  def update
    @cart_item = CartItem.find(params[:id])
    if params[:cart_item][:amount] == "0"
      @cart_item.destroy　##カートに商品がない場合カート削除
      redirect_to cart_items_path
    elsif @cart_item.update(amount: params[:cart_item][:amount])##カート内商品の個数が変わった
      redirect_to cart_items_path
    else
      #render index
    end
  end

  def destroy
    current_customer.cart_items.find(params[:id]).destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    #params.require(:item).permit(:item_id, :amount)
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
