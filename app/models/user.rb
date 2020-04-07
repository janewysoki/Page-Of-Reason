class User < ApplicationRecord
    has_many :reviews
    has_many :books # that the user has created
    #has_many :reviewed_books, through :reviews, source: :book
   
end
