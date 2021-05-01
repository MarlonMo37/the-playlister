class CreatePlaylistsSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists_songs do |t|
      t.references :playlist, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
