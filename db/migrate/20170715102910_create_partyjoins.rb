class CreatePartyjoins < ActiveRecord::Migration
  def change
    create_table :partyjoins do |t|
      t.integer :partypost_id
      t.integer :user_id
      t.timestamps
    end
  end
end
