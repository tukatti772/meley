class RenameDairyTextColumnToDairyanswers < ActiveRecord::Migration
  def change
      rename_column :dairyanswers, :dairy_text, :dairy_title
  end
end
