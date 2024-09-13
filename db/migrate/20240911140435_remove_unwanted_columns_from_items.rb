class RemoveUnwantedColumnsFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :product
    remove_column :items, :price
    remove_column :items, :explain
    remove_column :items, :category_id
    remove_column :items, :condition_id
    remove_column :items, :shipping_fee_id
    remove_column :items, :prefecture_id
    remove_column :items, :required_number_of_day_id
  end
end