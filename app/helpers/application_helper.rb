module ApplicationHelper

    def conditional_errors(object)
        if object.errors.any?
        render partial: "shared/errors", locals: {object: object}
        end
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

    def redirect_if_logged_in
        redirect_to playlists_path if logged_in?
    end

    def logo
        if logged_in?
            tag.li class: "nav-item" do
                content_tag("a", "The Playlister", href: "#{user_path(current_user)}")  
            end     
        else
            tag.li class: "nav-item" do
                content_tag("a", "The Playlister", href: "#{login_path}")
            end
        end
    end
end
