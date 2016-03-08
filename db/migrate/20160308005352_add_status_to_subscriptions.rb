class AddStatusToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :status, :integer, default: 1
  end
end
