class Song < ApplicationRecord
    has_many :playlist_songs
    has_many :songs, through
    validates :name, presence: true
    validates :genre, presence: true
    validates :artist_name, presence: true
    validates :lyrics, presence: true
end
