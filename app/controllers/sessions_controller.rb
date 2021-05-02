class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def new
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            redirect_to login_path, error: "Your username or password is incorrect"
        end
    end

    def omniauth
        @user = User.from_omniauth(auth)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/login'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end