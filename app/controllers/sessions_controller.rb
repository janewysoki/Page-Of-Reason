class SessionsController < ApplicationController
    def index
    end

    def destroy
        session[:user_id].destroy
        redirect_to '/'
    end
end