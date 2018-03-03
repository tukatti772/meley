class AddToeflToUsers < ActiveRecord::Migration
  def change
    add_column :users, :toefl, :integer
  end
end
