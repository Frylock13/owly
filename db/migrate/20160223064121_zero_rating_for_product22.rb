class ZeroRatingForProduct22 < ActiveRecord::Migration
  def change
    change_column :products, :rating, :float, precision: 5, scale: 2, default: 0.00
  end
end
