class SongsController < ApplicationController

    def index
        @songs = Song.all
        @user = current_user
    end

    def update
        @playlist =  Playlist.find_by(name: params["s"]["playlists"])
        @song = Song.find_by(id: params[:id])
        @playlist.songs << @song
    end

    def destroy
        byebug
        @playlist = Playlist.find_by(id: params["s"]["playlist_id"])
        @song =  Song.find_by(id: params["id"])

        @playlist.songs.delete(@song)
    end

    private

    def song_params
        params.require(:song).permit(:name, :preview, artist_name, album_name, album_avatar)
    end
end
