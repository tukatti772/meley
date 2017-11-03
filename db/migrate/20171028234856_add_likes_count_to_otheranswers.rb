class AddLikesCountToOtheranswers < ActiveRecord::Migration
  def change
    add_column :otheranswers, :likes_count, :integer, default:0
  end
end
