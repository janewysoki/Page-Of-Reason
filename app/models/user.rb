class User < ApplicationRecord
    has_many :reviews
    has_many :books, through :reviews
    #these lines won't work if you switch their order
end
