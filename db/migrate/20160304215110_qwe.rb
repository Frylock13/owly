class Qwe < ActiveRecord::Migration
  def change
    add_column :products, :art, :string
    add_column :products, :length, :integer
  end
end
