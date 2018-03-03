class AddToeicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :toeic, :integer
  end
end
