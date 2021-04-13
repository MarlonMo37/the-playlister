class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name 
      t.string :artist_name
      t.text :lyrics
      t.string :genre

      t.timestamps
    end
  end
end
