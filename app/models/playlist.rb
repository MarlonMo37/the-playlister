class Playlist < ApplicationRecord
    belongs_to :user
    has_many :playlists_songs
    has_many :songs, through: :playlists_songs
    validates :name, presence: true
    validates :name, uniqueness: { scope: :user_id}
    accepts_nested_attributes_for :playlists_songs

end
