class SongsController < ApplicationController

    def index
        @songs = Song.all
        @user = current_user
    end

    def update
        @playlist =  Playlist.find_by(name: params["s"]["playlists"])
        @song = Song.find_by(id: params[:id])
        @playlist.songs << @song
        redirect_to songs_path
    end

    def destroy
        @playlist = Playlist.find_by(id: params["s"]["playlist_id"])
        @song =  Song.find_by(id: params["id"])

        @playlist.songs.delete(@song)
        redirect_to playlist_path(@playlist)
    end

    private

    def song_params
        params.require(:song).permit(:name, :preview, artist_name, album_name, album_avatar)
    end
end
