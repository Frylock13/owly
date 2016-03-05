class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :tel
      t.string :email
      t.string :city
      t.string :street
      t.string :building
      t.string :block
      t.integer :apt
      t.integer :floor
      t.text :comment
      t.string :company_name
      t.string :inn
      t.string :products
      t.integer :status, default: 0
      t.text :admin_comment

      t.timestamps null: false
    end
  end
end
