class SessionsController < ApplicationController
    
    def index
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new
    end

    def create
        if params[:provider] == 'google_oauth2'
            @user = User.create_by_google_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                flash[:message] = "Books you have personally read and reviewed will always appear here, on your homepage."
                redirect_to user_path(@user)
            else
                flash[:error] = "Sorry, your login info was incorrect. Please try again." #intentionally not saying whether password or username is wrong cause that makes it easier to break in
                redirect_to login_path
            end
        end
    end

    def omniauth
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end