class AddSeoTags < ActiveRecord::Migration
  def change
    add_column :pages, :seo_title, :string
    add_column :pages, :seo_description, :string
    add_column :pages, :seo_keywords, :string
    add_column :products, :seo_title, :string
    add_column :products, :seo_description, :string
    add_column :products, :seo_keywords, :string
    add_column :categories, :seo_title, :string
    add_column :categories, :seo_description, :string
    add_column :categories, :seo_keywords, :string
  end
end
