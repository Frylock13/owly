class AddToProductsRelated < ActiveRecord::Migration
  def change
    add_column :products, :related, :string
  end
end
