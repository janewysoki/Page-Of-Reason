class AuthorsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @authors = Author.alphabetize
    end
end
