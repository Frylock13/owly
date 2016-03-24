class AddSortToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :sort, :float
  end
end
