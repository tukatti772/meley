class CreateOthers < ActiveRecord::Migration
  def change
    create_table :others do |t|
      t.string :name
      t.text :text
      t.timestamps null: false
    end
  end
end
