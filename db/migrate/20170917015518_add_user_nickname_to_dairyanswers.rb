class AddUserNicknameToDairyanswers < ActiveRecord::Migration
  def change
    add_column :dairyanswers, :user_nickname, :string
  end
end
