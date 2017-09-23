class AddUserIdToDairyanswers < ActiveRecord::Migration
  def change
    add_column :dairyanswers, :user_id, :integer
  end
end
