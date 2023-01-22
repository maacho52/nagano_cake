class Public::HomesController < ApplicationController
  def top
    @item = Item.first(4)
    @items = Item.all
  end

  def about
  end
end
