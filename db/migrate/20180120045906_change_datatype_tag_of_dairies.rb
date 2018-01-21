class ChangeDatatypeTagOfDairies < ActiveRecord::Migration
  def change
    change_column :dairies,:tag,:text
  end
end
