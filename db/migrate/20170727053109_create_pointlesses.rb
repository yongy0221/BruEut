class CreatePointlesses < ActiveRecord::Migration
  def change
    create_table :pointlesses do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :hit
      t.integer :like
      t.integer :dislike
      t.timestamps null: false
    end
  end
end
