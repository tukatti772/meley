class AddLikesCountToDairyanswers < ActiveRecord::Migration
  def change
    add_column :dairyanswers, :likes_count, :integer, default:0
  end
end
