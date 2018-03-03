class AddEikenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :eiken, :string
  end
end
