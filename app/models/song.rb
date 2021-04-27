class Song < ApplicationRecord
    has_many :playlists_songs
    has_many :playlists, through: :playlists_songs
    validates :name, presence: true
    validates :artist_name, presence: true


    def self.organize_songs_from_playlist(tracks)
        tracks.each do |track|
            song_info = {}
            song_info["name"] = track["title"]
            song_info["preview"] = track["preview"]
            song_info["artist_name"] = track["artist"]["name"]
            song_info["album_name"] = track["album"]["title"]
            song_info["album_avatar"] = track["album"]["cover_medium"]
            Song.find_or_create_by(song_info)
        end
    end

    def self.get_song_info
        playlist_ids = [1677006641, 1996494362, 1997855286, 178699142, 3185085222, 1273315391, 5171651864, 1976454162, 1479458365, 4676818664, 1306931615, 1291471565, 2021626162, 1964028802, 2098157264, 1999466402, 1282483245, 1963962142, 789123393, 1227811731] 
        playlist_ids.each do |number|
            url = URI("https://deezerdevs-deezer.p.rapidapi.com/playlist/#{number}")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = ENV['API_KEY'] 
            request["x-rapidapi-host"] = 'deezerdevs-deezer.p.rapidapi.com'  
            response = http.request(request)
            inform = response.read_body
            all_tracks = JSON.parse(inform)
            tracks = all_tracks["tracks"]["data"]

            self.organize_songs_from_playlist(tracks)
        end
    end

   
    
   

end

