class RenameBusinessTextColumnToBusianswers < ActiveRecord::Migration
  def change
    rename_column :busianswers, :business_text, :business_title
  end
end
