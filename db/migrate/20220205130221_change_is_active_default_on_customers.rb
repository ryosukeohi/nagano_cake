class ChangeIsActiveDefaultOnCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :is_active, from: "t", to: true
  end
end
