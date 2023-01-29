class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @amount = 0
    while @amount <= 50 do
      p @amount
      @amount += 1
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
  end
end
