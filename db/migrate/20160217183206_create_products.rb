class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.integer :price
      t.float :rating
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
