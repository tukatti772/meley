class AddLabelToOtheranswers < ActiveRecord::Migration
  def change
    add_column :otheranswers, :label, :string
  end
end
