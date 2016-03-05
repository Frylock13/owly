class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.integer :price
      t.float :rating
      t.integer :height
      t.integer :width
      t.integer :depth
      t.text :material
      t.string :art
      t.integer :length
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
