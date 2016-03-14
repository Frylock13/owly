class Adds < ActiveRecord::Migration
  def change
    remove_column :questions, :closed
    add_column :questions, :status, :integer, default: 0
  end
end
