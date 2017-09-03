class CreateForestAdmins < ActiveRecord::Migration
  def change
    create_table :forest_admins do |t|
      t.string :content
      t.integer :like
      t.integer :dislike
      t.timestamps null: false
    end
  end
end
