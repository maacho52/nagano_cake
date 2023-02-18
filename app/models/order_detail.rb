class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  # 製造ステータス（0=製作不可 / 1=製作待ち / 2=製作中 / 3=製作完了 ）
  enum making_status: { impossible: 0, production_waiting: 1, production_making: 2, completed: 3 }
end
