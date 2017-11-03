class RenameLikesColumnToBusinesses < ActiveRecord::Migration
  def change
    change_table :businesses do |t|
      t.remove :likes
      t.integer :likes_count, default: 0
    end
  end
end
