class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :tier, :integer, default: 9
  end
end
