class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
