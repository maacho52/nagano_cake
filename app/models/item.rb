class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  validates :is_active, inclusion: [true, false]
  
  ## 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
end
