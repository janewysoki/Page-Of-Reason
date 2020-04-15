class AuthorsController < ApplicationController

    def index
        @authors = Author.alphabetize
    end
end
