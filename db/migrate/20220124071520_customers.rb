class Customers < ActiveRecord::Migration[5.2]
  def change
  drop_table :customers
  end
end
