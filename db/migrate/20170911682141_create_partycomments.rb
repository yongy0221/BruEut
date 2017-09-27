class CreatePartycomments < ActiveRecord::Migration
  def change
    create_table :partycomments do |t|
      t.integer :user_id
      t.text :content
      t.integer :partypost_id
      t.timestamps
    end
  end
end
