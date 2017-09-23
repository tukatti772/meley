class CreateDairyanswers < ActiveRecord::Migration
  def change
    create_table :dairyanswers do |t|
      t.string :name
      t.integer :dairy_id
      t.text :text
      t.timestamps null: false
    end
  end
end
