class CreateBusianswers < ActiveRecord::Migration
  def change
    create_table :busianswers do |t|
      t.string :name
      t.integer :business_id
      t.text :text
      t.timestamps null: false
    end
  end
end
