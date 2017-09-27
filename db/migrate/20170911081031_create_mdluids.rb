class CreateMdluids < ActiveRecord::Migration
  def change
    create_table :mdluids do |t|
      t.integer :user_id
      t.references :market, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
