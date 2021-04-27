class Playlist < ApplicationRecord
    belongs_to :user
    has_many :playlists_songs
    has_many :songs, through: :playlists_songs
    # validates :user, presence: true
    validates :name, presence: true
    validates :name, uniqueness: { scope: :user_id}

end
