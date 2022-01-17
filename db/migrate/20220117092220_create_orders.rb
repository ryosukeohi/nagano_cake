class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, :null => false
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :postal_code, :null => false
      t.integer :order_status, :null => false, default: 1
      t.integer :payment, :null => false, default: 1
      t.integer :postage, :null => false
      t.integer :pay, :null => false
      t.datetime :created_at, default: -> { 'NOW()' }
      t.datetime :updated_at, default: -> { 'NOW()' }

      t.timestamps
    end
  end
end
