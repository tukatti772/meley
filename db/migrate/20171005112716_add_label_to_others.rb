class AddLabelToOthers < ActiveRecord::Migration
  def change
    add_column :others, :label, :string
  end
end
