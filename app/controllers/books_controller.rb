class BooksController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def index
        @books = Book.alphabetize
    end

    def new
        @book = Book.new
        @book.build_author #WHAT IS THIS DOING; better to place this in new instead of edit
    end

    def create
        #@book = Book.new(book_params)
        #@book.user_id = session[:user_id]
        @book = current_user.books.build(book_params) #builds association
        if @book.save #this is where validation happens
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
        if @book.update(book_params) #@book.update(title: params[:book][:title], author: params[:book][:author_id], description: params[:book][:description])
            redirect_to book_path(@book)
        else
            render :edit
        end
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
