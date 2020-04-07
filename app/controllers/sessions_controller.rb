class SessionsController < ApplicationController
    def index
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new
    end
    
end