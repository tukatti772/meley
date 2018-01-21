class AddTagToTags < ActiveRecord::Migration
  def change
    add_column :tags, :tag, :text
  end
end
