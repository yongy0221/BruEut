class CreatePcomments < ActiveRecord::Migration
  def change
    create_table :pcomments do |t|
      t.string :commenter
      t.integer :user_id
      t.text :body
      t.references :pointless, index: true, foreign_key: true

      t.timestamps null: false
    end

  end
end
