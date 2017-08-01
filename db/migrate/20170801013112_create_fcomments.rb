class CreateFcomments < ActiveRecord::Migration
  def change
    create_table :fcomments do |t|
      t.string :commenter
      t.text :body
      t.integer :user_id
      t.references :forest, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
