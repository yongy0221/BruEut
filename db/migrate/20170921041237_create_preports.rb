class CreatePreports < ActiveRecord::Migration
  def change
    create_table :preports do |t|
      t.string :user_id
      t.text :why
      t.string :plink

      t.timestamps null: false
    end
  end
end
