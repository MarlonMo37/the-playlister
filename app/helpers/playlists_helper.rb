module PlaylistsHelper

    def show_rating(song_id, playlist_id)
        ps = PlaylistsSong.find_by(song_id: song_id, playlist_id: playlist_id)
        if ps.rating == nil
            content_tag(:h3, "Rating: 0/5")
        else
            content_tag(:h3, "Rating: #{ps.rating}/5 ")
        end
    end

    def show_playlists(playlists)
        if playlists.length == 0
            content_tag(:h3, "You have no playlists, please create one!!")
        else
            render partial: "playlist"
        end
    end

    def show_all_songs(playlist)
        if playlist.songs.length == 0
            content_tag(:h3, "This playlist has no tracks, add some")
        else
            playlist.songs.map do |song|
               show_song(song, playlist)
            end.join.html_safe
        end
    end

    def show_song(song, playlist)
        tag.div class: "song-contrainer" do 
            concat render partial: "songs/song", locals: {song:song}
            concat show_rating(song.id, playlist.id)
            concat render partial: "delete", locals: {song: song, playlist: playlist}
        end
    end
end
