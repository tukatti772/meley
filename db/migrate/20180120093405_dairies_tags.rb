class DairiesTags < ActiveRecord::Migration
  def change
     create_table :dairies_tags do |t|
      t.integer :tag_id
      t.integer :dairy_id
    end
  end
end
