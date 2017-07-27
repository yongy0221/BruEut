class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :article
      t.integer :user_id
      t.integer :total
      t.timestamps
    end
  end
end
