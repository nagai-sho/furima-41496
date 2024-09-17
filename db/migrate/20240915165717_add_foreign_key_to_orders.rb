class AddForeignKeyToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :user, null: false, foreign_key: true
    add_reference :orders, :item, null: false, foreign_key: true
  end
end
