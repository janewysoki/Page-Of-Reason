module ReviewsHelper

    def display_review_header
        if params[:book_id]
            content_tag(:h1, "Write a review for #{@book.title} by #{@review.book.author.name}")
        else
            content_tag(:h1, "Write a Review")  #IN WHAT SITUATION WOULD THIS HIT THE ELSE?
        end
    end

end

#same as code above but not in ruby
#<% if params[:book_id] %> #do we have params book id? if we do, below is our title
#   <h1>Write a Review for <%= @review.book.title %> by <%= @review.book.author.name %></h1>
#<% else %> #if we don't have those params then here's a different h1 below
#    <h1>Write a Review</h1>
#<% end %>