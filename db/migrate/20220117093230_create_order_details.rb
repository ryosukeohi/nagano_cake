class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, :null => false
      t.integer :item_id, :null => false
      t.integer :purchase_price, :null => false
      t.integer :quantity, :null => false
      t.integer :make_status, :null => false, default: 1
      t.datetime :created_at, default: -> { 'NOW()' }
      t.datetime :updated_at, default: -> { 'NOW()' }

      t.timestamps
    end
  end
end
