class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :text
      t.string :slug
      t.string :heading

      t.timestamps null: false
    end
  end
end
