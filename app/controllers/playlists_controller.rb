class PlaylistsController < ApplicationController
    before_action :redirect_if_not_logged_in
    layout "playlist"

    def index
        if params[:user_id] && @user = User.find(params[:user_id])
            @playlists = @user.playlists
        else
            @playlists = Playlist.all
        end
    end

    def new
        if params[:user_id] && @user = User.find(params[:user_id])
            @playlist = Playlist.new(user_id: params[:user_id])
        else
            @playlist = Playlist.new
        end
    end

    def create
        @user = current_user
        @playlist = Playlist.create(playlist_params)
        if @playlist.valid?
            redirect_to user_playlists_path(@user)
        else
            render :new
        end
    end
    
    def show
        @playlist = find_playlist
        render :layout => "application"
    end

    def edit
        @user = current_user
        @playlist = find_playlist
    end

    def update 
        @user = current_user
        @playlist = find_playlist
        if @playlist.update(playlist_params)
            redirect_to user_playlists_path(@user)
        else 
            render :edit
        end
    end

    def destroy
        @user = current_user
        @playlist = find_playlist
        @playlist.destroy
        redirect_to user_playlists_path(@user)
    end

    private

    def find_playlist
        @playlist = Playlist.find_by_id(params[:id])
    end

    def playlist_params
        params.require(:playlist).permit(:name, :favorite, :user_id, playlists_songs_attributes: [:playlist_id, :song_id, :rating, :id])
    end
end
