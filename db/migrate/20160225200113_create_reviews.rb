class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.text :text
      t.float :rating
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
