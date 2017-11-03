class AddLikesCountToOthers < ActiveRecord::Migration
  def change
    add_column :others, :likes_count, :integer, default:0
  end
end
