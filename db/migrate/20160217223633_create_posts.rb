class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.string :tags
      t.string :seo_title
      t.string :seo_keywords
      t.string :seo_description

      t.timestamps null: false
    end
  end
end
