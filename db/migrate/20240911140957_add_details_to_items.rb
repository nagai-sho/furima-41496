class AddDetailsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column    :items, :product,                   :string,  null: false
    add_column    :items, :price,                     :integer, null: false
    add_column    :items, :explain,                   :text,    null: false
    add_column    :items, :category_id,               :integer, null: false
    add_column    :items, :condition_id,              :integer, null: false
    add_column    :items, :shipping_fee_id,           :integer, null: false
    add_column    :items, :prefecture_id,             :integer, null: false
    add_column    :items, :required_number_of_day_id, :integer, null: false
    add_reference :items, :user,                                null: false, foreign_key: true
  end
end
