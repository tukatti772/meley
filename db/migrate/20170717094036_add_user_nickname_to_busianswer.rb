class AddUserNicknameToBusianswer < ActiveRecord::Migration
  def change
    add_column :busianswers, :user_nickname, :string
  end
end
