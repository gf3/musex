class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :followee, index: true
      t.references :follower, index: true

      t.timestamps
    end
  end
end
