class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.boolean :enable

      t.timestamps null: false
    end
  end
end
