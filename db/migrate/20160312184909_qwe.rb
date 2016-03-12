class Qwe < ActiveRecord::Migration
  def change
    add_column :posts, :tags, :text
  end
end
