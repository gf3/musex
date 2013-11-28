class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :image_url
      t.string :url
      t.string :source
      t.string :source_id

      t.timestamps
    end
  end
end
