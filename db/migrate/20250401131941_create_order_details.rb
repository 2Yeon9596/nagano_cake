class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :price
      t.integer :amount
      t.integer :making_status
      t.integer :order_id
      t.integer :item_id
      t.timestamps
    end
  end
end
