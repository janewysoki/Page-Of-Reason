class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def new
        @book = Book.new
        @book.build_author #WHAT IS THIS DOING; better to place this in new instead of edit
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = session[:user_id]
        if @book.save #this is where validation happens
            redirect_to book_path(@book)
        else
            @book.build_author
            render :new
        end
    end

    def show
        @book = Book.find_by(params[:id])
        #redirect_to books_path if !@book
    end

    private

    def book_params
        params.require(:book).permit(:title, :description, :author_id, author_attributes: [:name])
    end
end
