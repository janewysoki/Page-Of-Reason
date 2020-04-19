class AuthorsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @authors = Author.alphabetize
    end

    def show
        @author = Author.find_by(id: params[:id])
        @books = @author.books
    end
end
