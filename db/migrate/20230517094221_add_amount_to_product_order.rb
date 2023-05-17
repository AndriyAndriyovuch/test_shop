class AddAmountToProductOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :product_orders, :amount, :integer, null: false
  end
end
