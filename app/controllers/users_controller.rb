class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: :show 

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else 
            render :new
        end
    end 

    def show 
        @user = current_user
        @playlists = current_user.playlists
    end


    private

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end
end
