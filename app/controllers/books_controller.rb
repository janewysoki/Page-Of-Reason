class BooksController < ApplicationController

    def index
    end
    
    def new
        @book = Book.new
        @book.build_author #WHAT IS THIS DOING; better to place this in new instead of edit
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = session[:user_id]
        if @book.save
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :description, :author_id, author_attributes: [:name])
    end
end
