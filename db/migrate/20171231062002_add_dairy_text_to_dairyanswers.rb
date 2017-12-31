class AddDairyTextToDairyanswers < ActiveRecord::Migration
  def change
    add_column :dairyanswers, :dairy_text, :text
  end
end
