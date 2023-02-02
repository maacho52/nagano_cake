class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  # 支払方法
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  # 注文ステータス（0=入金待ち / 1=入金確認 / 2=製作中 / 3=発送準備中 / 4=発送済み）
  enum order_status: { waiting: 0, paid_up: 1, making: 2, preparing: 3, shipped: 4 }
end
