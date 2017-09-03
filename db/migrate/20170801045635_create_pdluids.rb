class CreatePdluids < ActiveRecord::Migration
  def change
    create_table :pdluids do |t|
      t.integer :user_id
      t.references :pointless, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
