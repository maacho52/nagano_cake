class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def index
    @items = Item.all.page(params[:page]).per(10)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
  
  
end
