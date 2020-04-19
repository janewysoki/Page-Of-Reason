class BooksController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def index
        @books = Book.alphabetize
    end

    def new
        @book = Book.new
        @book.build_author 
    end

    def create
        @book = current_user.books.build(book_params)
        if @book.save
            flash[:message] = "Book successfully created."
            redirect_to book_path(@book)
        else
            @book.build_author
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        find_book
        if @book.update(book_params) 
            flash[:message] = "Book successfully edited."
            redirect_to book_path(@book)
        else
            render :edit
        end
    end
    
    def destroy
        Book.find_by(id: params[:id]).destroy
        flash[:message] = "Book successfully deleted."
        redirect_to book_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :description, :author_id, author_attributes: [:name])
    end

    def find_book
        @book = Book.find_by(id: params[:id])
        redirect_to books_path if !@book
    end
end
