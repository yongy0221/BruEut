class CreateMluids < ActiveRecord::Migration
  def change
    create_table :mluids do |t|
      t.integer :user_id
      t.references :market, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
