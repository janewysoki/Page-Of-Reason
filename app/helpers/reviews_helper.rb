module ReviewsHelper
    def display_review_header
        if params[:book_id]
            content_tag(:h1, "Write a review for #{@book.title} by #{@review.book.author.name}")
        else
            content_tag(:h1, "Write a Review")
        end
    end
end
