class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.boolean :favorite

      t.timestamps
    end
  end
end
