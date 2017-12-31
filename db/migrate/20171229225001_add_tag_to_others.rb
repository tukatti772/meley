class AddTagToOthers < ActiveRecord::Migration
  def change
    add_column :others, :tag, :text
  end
end
