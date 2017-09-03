class CreatePartyposts < ActiveRecord::Migration
  def change
    create_table :partyposts do |t|
      t.string :article
      t.integer :user_id
      t.integer :total
      t.timestamps
    end
  end
end
