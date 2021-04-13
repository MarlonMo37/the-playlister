class Song < ApplicationRecord
    has_many :playlist_songs
    has_many :songs, through 
end
