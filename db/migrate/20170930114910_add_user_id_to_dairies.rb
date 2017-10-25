class AddUserIdToDairies < ActiveRecord::Migration
  def change
    add_column :dairies, :user_id, :integer
  end
end
