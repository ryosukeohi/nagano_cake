class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.string :last_name_kana, :null => false
      t.string :first_name_kana, :null => false
      t.string :email, :null => false
      t.string :encrypted_password, :null => false
      t.string :postal_code, :null => false
      t.string :address, :null => false
      t.string :telephone_number, :null => false
      t.string :is_active, :null => false, default: true
      t.datetime :created_at, default: -> { 'NOW()' }
      t.datetime :updated_at, default: -> { 'NOW()' }

      t.timestamps
    end
  end
end
