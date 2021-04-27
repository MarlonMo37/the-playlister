class User < ApplicationRecord
    has_many :playlists
    has_many :songs, through: :playlists
   
    validates :password, presence: true, length: {in: 10..100}, confirmation: true
    validates :username, presence: true, uniqueness: true, length: {in: 5..30}, exclusion: {in: %w(admin superadmin user)}
    validates :email, presence: true, uniqueness: true, email: true
    has_secure_password
end
