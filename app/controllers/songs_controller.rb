class SongsController < ApplicationController

    private

    def song_params
        params.require(:song).permit(:name, :preview, artist_name, album_name, album_avatar)
    end
end
