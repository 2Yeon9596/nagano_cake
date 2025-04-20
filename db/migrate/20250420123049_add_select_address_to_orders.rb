class AddSelectAddressToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :select_address, :integer, null: false
  end
end
