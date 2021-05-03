module SongsHelper

    def add_to_playlist(song, user)
        if user
            pl = user.playlists.map {|p| p['name'] if p.songs.include?(song) != true }
            if pl.length != 0
                render partial: "add", locals: {song: song, pl: pl}
            end
        end
    end

end
