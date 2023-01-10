class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  validates :is_active, inclusion: [true, false]
end
