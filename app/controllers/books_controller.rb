class BooksController < ApplicationController

    def index
        @books = Book.order_by_rating 
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
            render :new
        end
    end

    def show
        @book = Book.find_by(id: params[:id]) #find by id
        if !@book
            redirect_to books_path
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        @book.update(title: params[:book][:title], author: params[:book][:author_id], description: params[:book][:description])
        redirect_to book_path(@book)
      end
      

    private

    def book_params
        params.require(:book).permit(:title, :description, :author_id, author_attributes: [:name])
    end
end