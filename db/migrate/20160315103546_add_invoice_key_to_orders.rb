class AddInvoiceKeyToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :invoice_key, :string
  end
end
