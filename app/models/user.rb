class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_books, through: :reviews, source: :book
    has_many :books # that the user has created
    
    
    validates :username, uniqueness: true, presence: true
    
    has_secure_password #(gives us authenticate )


end
