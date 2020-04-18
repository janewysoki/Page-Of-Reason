class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in? #explain purpose

    private
    
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?   #how do i know when to use this?
    end
end
