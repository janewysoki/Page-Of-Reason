class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_review, only: [:show, :edit, :update]

    def new
        if @book = Book.find_by_id(params[:book_id]) 
            @review = @book.reviews.build 
        else 
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params) 
        if @review.save 
            flash[:message] = "Review successfully created."
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
    end

    def index
        if @book = Book.find_by_id(params[:book_id])
            @reviews = @book.reviews 
        else 

            @books = Book.alphabetize
        end
    end

    def edit
    end

    def update
        @review.update(review_params)
        flash[:message] = "Review successfully edited."
        redirect_to review_path(@review)
    end

    def destroy
        Review.find_by(id: params[:id]).destroy
        flash[:message] = "Review successfully deleted."
        redirect_to review_path
    end
    
    private

    def review_params
        params.require(:review).permit(:book_id, :rating, :content, :title)
    end

    def find_review
        @review = Review.find_by(id: params[:id])
        redirect_to reviews_path if !@review
    end
end
