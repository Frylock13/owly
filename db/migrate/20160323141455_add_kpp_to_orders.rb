class AddKppToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :kpp, :string
  end
end
