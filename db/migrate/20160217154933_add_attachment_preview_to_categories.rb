class AddAttachmentPreviewToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :categories, :preview
  end
end
