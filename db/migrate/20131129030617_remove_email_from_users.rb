class RemoveEmailFromUsers < ActiveRecord::Migration
  def change
    remove_index :users,  :email
    remove_column :users, :email
  end
end
