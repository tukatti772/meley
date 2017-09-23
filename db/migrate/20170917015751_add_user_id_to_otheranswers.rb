class AddUserIdToOtheranswers < ActiveRecord::Migration
  def change
    add_column :otheranswers, :user_id, :integer
  end
end
