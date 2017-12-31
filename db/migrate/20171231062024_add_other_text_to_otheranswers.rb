class AddOtherTextToOtheranswers < ActiveRecord::Migration
  def change
    add_column :otheranswers, :other_text, :text
  end
end
