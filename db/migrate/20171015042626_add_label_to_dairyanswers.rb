class AddLabelToDairyanswers < ActiveRecord::Migration
  def change
    add_column :dairyanswers, :label, :string
  end
end
