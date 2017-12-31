class AddTagToDairies < ActiveRecord::Migration
  def change
    add_column :dairies, :tag, :string
  end
end
