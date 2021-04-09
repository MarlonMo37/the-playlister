class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.boolean :favorite
      t.references :listener, foreign_key: {to_table: :users, on_delete: :cascade}

      t.timestamps
    end
  end
end
