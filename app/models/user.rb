class User < ApplicationRecord
    has_many :playlists
    has_many :songs, through: :playlists
    has_secure_password
    validates :password, length: {in: 10..100}, confirmation: true
    validates :username, uniqueness: true, length: {in: 5..30}, exclusion: {in: %w(admin superadmin user)}
    validates :email, presence: true, uniqueness: true, email: true
end
