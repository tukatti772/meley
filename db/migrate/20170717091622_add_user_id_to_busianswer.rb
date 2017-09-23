class AddUserIdToBusianswer < ActiveRecord::Migration
  def change
    add_column :busianswers, :user_id, :integer
  end
end
