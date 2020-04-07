class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user #creator of it/singular user instances
  has_many :reviews
  has_many :users, through :reviews #people who have reviewed it/plural user instances
end

#not treating book as a join table