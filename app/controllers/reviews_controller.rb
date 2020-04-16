class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_review, only: [:show, :edit, :update]

    def new
        #if it's nested, do it this way
        if @book = Book.find_by_id(params[:book_id]) 
        #this is nested route so we want review to already know about book it's associated with
            @review = @book.reviews.build #(reviews.build instead of build.review beacuse a book doesn't belong to a review)
        else #if it's not nested
            @review = Review.new
        end
    end

    def create
        #@review = Review.new(review_params) #instantiate rather than create cause of validations
        @review = current_user.reviews.build(review_params) #have to have a help method for current_user to use this line of code
        #line above could also be: @review.user_id = session[:user_id]
        if @review.save #automatically checks belongs to relationship
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
    end

    def index
        #how do i check if it's nested? if it's nested - do this, if not - do that
        #if it's nested - we only want to show reviews for that book
        #if we have param called book id that's the difference between nested and not nested routes
        if @book = Book.find_by_id(params[:book_id]) #if it's nested AND we successfully find a book from the nested id
            @reviews = @book.reviews.alphabetize #all of this book id's reviews
        else #if it's not nested
            @reviews = Review.all.alphabetize
        end
    end

    def edit
    end

    def update
        @review.update(review_params)
        redirect_to review_path(@review)
    end
    
    private
    #because we're doing hidden field, when i post this route, it posts to normal route like a normal review
    def review_params
        params.require(:review).permit(:book_id, :rating, :content, :title)
    end

    def find_review
        @review = Review.find_by(id: params[:id])
        redirect_to reviews_path if !@review
    end
end
