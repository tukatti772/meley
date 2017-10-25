class AddLabelToBusianswers < ActiveRecord::Migration
  def change
    add_column :busianswers, :label, :string
  end
end
