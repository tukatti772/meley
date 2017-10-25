class AddLikesToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :likes, :integer
  end
end
