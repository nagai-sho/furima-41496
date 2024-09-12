class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :required_number_of_day

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

  validates :category_id, :condition_id, :shipping_fee, :prefecture, :required_number_of_day,
            numericality: { other_than: 1, message: "can't be blank" }
end
