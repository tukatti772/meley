class AddBusinessTextToBusianswers < ActiveRecord::Migration
  def change
    add_column :busianswers, :business_text, :text
  end
end
