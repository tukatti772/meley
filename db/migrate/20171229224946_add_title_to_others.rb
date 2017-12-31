class AddTitleToOthers < ActiveRecord::Migration
  def change
    add_column :others, :title, :text
  end
end
