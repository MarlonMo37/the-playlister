class PlaylistsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @playlists = Playlist.all
    end

    def new
        @user = current_user
        @playlist = Playlist.new
    end

    def create
        @user = current_user
        @playlist = Playlist.create(playlist_params)
        if @playlist.valid?
            redirect_to playlists_path
        else
            render :new
        end
    end
    
    def show
        @playlist = find_playlist
    end

    def edit
        @user = current_user
        @playlist = find_playlist
    end

    def update 
        byebug
        @user = current_user
        @playlist = find_playlist
        if @playlist.update(playlist_params)
            redirect_to playlists_path
        else 
            render :edit
        end
    end

    def destroy
        find_playlist
        @playlist.destroy
        redirect_to playlists_path
    end

    private

    def find_playlist
        @playlist = Playlist.find_by_id(params[:id])
    end

    def playlist_params
        params.require(:playlist).permit(:name, :favorite, :user_id, playlists_songs_attributes: [:playlist_id, :song_id, :rating, :id])
    end
end
