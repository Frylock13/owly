class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :tel
      t.text :text
      t.boolean :closed, default: false

      t.timestamps null: false
    end
  end
end
