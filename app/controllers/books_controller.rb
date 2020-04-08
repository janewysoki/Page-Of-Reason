class BooksController < ApplicationController

    def new
        @book = Book.new
        @book.build_author #WHAT IS THIS DOING; better to place this in new instead of edit
    end

    private

    def book_params
        params.require(:book).permit(:title, :description, :author_id, author_attributes: [:name])
    end
end
