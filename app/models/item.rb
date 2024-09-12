class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product
    validates :explain
    validates :price
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :require_number_of_day_id
  end
end
