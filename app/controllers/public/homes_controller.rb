class Public::HomesController < ApplicationController
  def top
    @item = Item.first(4)
    @items = Item.all.last(4)
  end

  def about
  end
end
