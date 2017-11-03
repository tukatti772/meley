class AddLikesCountToDairies < ActiveRecord::Migration
  def change
    add_column :dairies, :likes_count, :integer, default:0
  end
end
