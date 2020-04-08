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
        #does the user exist in our system? try to find the user in the system
        @ user = User.find_by(username: params[:id])  #find by is better here because you have to put a key of username, not user id; FIND BY doesn't throw an error
        #did we find a user and did they put in the right password?
        #if @user && @user.authenticate(params[:user][:password])
        if @user.try(authenticate, params[:user][:password]) #try is active support method. whatever object the method try is called on (here, the user) - before calling the method, try says is my user nil or is it something. if user is found, it will authenticate. if no user is found, it will return nil
            #if right user, you're authenticated and good to go so we need to create a session key to store the user in; how they get logged in
            session[:user_id] = @user.id #logs the user in
            redirect_to user_path(@user)
        else
            #if they dont correctly login
            flash[:error] = "Sorry, you're login info was incorrect. Please try again." #intentionally not saying whether password or username is wrong cause that makes it easier to break in
            redirect_to login_path
        end
    end
end