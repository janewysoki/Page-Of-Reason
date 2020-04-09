class ReviewsController < ApplicationController

    def new
        @book = Book.find_by_id(params[:book_id])
        #this is nested route so we want review to already know about book it's associated with
        @review = @book.reviews.build #(reviews.build instead of build.review beacuse a book doesn't belong to a review)
    end

    def index
    end

end
