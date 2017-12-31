class AddTitleToDairies < ActiveRecord::Migration
  def change
    add_column :dairies, :title, :string
  end
end
