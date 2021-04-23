class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name 
      t.string :preview
      t.string :artist_name
      t.string :album_name
      t.string :album_avatar

      t.timestamps
    end
  end
end
