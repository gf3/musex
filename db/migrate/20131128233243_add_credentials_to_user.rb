class AddCredentialsToUser < ActiveRecord::Migration
  def up
    execute 'CREATE EXTENSION hstore'
    add_column :users, :credentials, :hstore, default: '', null: false
  end

  def down
    remove_column :users, :credentials
    execute 'DROP EXTENSION hstore'
  end
end
