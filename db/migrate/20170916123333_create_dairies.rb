class CreateDairies < ActiveRecord::Migration
  def change
    create_table :dairies do |t|
      t.string :name
      t.text :text
      t.timestamps null: false
    end
  end
end
