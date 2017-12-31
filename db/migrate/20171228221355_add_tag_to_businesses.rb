class AddTagToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :tag, :text
  end
end
