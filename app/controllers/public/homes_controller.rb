class Public::HomesController < ApplicationController
  def top
    @item = Item.first(4)
    @items = Item.all.first(4)
  end

  def about
  end
end
