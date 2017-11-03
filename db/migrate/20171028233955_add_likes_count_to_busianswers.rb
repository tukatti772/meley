class AddLikesCountToBusianswers < ActiveRecord::Migration
  def change
    add_column :busianswers, :likes_count, :integer, default:0
  end
end
