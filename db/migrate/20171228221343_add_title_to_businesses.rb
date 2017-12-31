class AddTitleToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :title, :text
  end
end
