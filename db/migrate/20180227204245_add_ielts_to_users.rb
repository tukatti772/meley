class AddIeltsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ielts, :integer
  end
end
