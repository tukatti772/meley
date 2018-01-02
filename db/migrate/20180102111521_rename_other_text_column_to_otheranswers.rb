class RenameOtherTextColumnToOtheranswers < ActiveRecord::Migration
  def change
      rename_column :otheranswers, :other_text, :other_title
  end
end
