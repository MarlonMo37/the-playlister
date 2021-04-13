class PlaylistsSong < ApplicationRecord
    belongs_to :song
    belongs_to :playlist
    validates :song, presence: true
    validates :playlist, presence: true
end