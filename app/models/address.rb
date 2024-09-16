class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to :prefecture_id

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :municipality
    validates :house_number
    validates :phone_number
  end
end
