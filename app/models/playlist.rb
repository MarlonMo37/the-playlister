class Playlist < ApplicationRecord
    belongs_to :listener, class_name: "User"
    has_many :playlist_songs
    has_many :songs, through: :playlist_songs

end
