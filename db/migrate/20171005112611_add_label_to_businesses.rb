class AddLabelToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :label, :string
  end
end
