class AddLabelToDairies < ActiveRecord::Migration
  def change
    add_column :dairies, :label, :string
  end
end
