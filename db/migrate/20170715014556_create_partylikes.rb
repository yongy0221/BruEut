class CreatePartylikes < ActiveRecord::Migration
  def change
    create_table :partylikes do |t|
      t.integer :partypost_id
      t.integer :user_id
      t.timestamps
    end
  end
end
