class AddColumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :firstname, :string, null: false, default: 'null_value'
    add_column :orders, :lastname, :string, null: false, default: 'null_value'
    add_column :orders, :address, :string, null: false, default: 'null_value'
    add_column :orders, :phone, :string, null: false, default: 'null_value'
  end
end
