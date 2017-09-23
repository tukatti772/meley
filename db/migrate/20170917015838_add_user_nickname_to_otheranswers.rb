class AddUserNicknameToOtheranswers < ActiveRecord::Migration
  def change
    add_column :otheranswers, :user_nickname, :string
  end
end
