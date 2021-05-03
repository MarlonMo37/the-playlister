class SongsController < ApplicationController
    before_action :redirect_if_not_logged_in, :except=>[:index]

    def index
        if params["search"]
            @songs = Song.search_by_name(params["search"])
            @user = current_user
            render :layout => "song"
        else
            @songs = Song.all
            @user = current_user
            render :layout => "song"
        end
    end

    def update
        @playlist =  Playlist.find_by(name: params["song"]["playlists"])
        @song = Song.find_by(id: params[:id])
        @playlist.songs << @song
        redirect_to songs_path
    end

    def destroy
        @playlist = Playlist.find_by(id: params["song"]["id"])
        @song =  Song.find_by(id: params["id"])
        @playlist.songs.delete(@song)
        redirect_to playlist_path(@playlist)
    end

    private

    def song_params
        params.require(:song).permit(:name, :preview, :artist_name, :album_name, :album_avatar)
    end
end
