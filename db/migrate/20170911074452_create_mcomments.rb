class CreateMcomments < ActiveRecord::Migration
  def change
    create_table :mcomments do |t|
      t.string :commenter
      t.integer :user_id
      t.text :body
      t.references :market, index: true, foreign_key: true

      t.timestamps null: false
    end

  end
end
