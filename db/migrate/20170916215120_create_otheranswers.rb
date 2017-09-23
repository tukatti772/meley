class CreateOtheranswers < ActiveRecord::Migration
  def change
    create_table :otheranswers do |t|
      t.string :name
      t.integer :other_id
      t.text :text
      t.timestamps null: false
    end
  end
end
