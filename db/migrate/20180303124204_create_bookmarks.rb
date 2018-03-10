class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :dairy_id
      t.timestamps null: false
    end
  end
end
