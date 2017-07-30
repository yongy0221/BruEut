class CreateForests < ActiveRecord::Migration
  def change
    create_table :forests do |t|
      t.text :content
      t.boolean :censored
      t.timestamps null: false
    end
  end
end
