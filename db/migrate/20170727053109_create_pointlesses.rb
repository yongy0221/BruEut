class CreatePointlesses < ActiveRecord::Migration
  def change
    create_table :pointlesses do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :user_name #delete if db:drop later
      t.integer :hit, default: 0
      t.integer :like, default: 0
      t.integer :dislike, default: 0
      t.timestamps null: false
    end
  end
end
