class CreateForestdislikes < ActiveRecord::Migration
  def change
    create_table :forestdislikes do |t|
      t.integer :forest_id
      t.integer :user_id
      t.timestamps
    end
  end
end
