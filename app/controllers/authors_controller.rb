class AuthorsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:search] 
            @authors = Author.search(params[:search]) 
        else
            @authors = Author.alphabetize
        end
    end

    def show
        @author = Author.find_by(id: params[:id])
        @books = @author.books
    end
end