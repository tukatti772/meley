class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :business_id
      t.integer :busianswer_id
      t.integer :dairy_id
      t.integer :dairyanswer_id
      t.integer :other_id
      t.integer :otheranswer_id
      t.timestamps null: false
    end
  end
end
