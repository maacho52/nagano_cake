class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def sum_of_price
    item.(price * 1.10) * amount
  end
end
