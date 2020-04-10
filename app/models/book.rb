class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user #creator of it/singular user instances
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed it/plural user instances
  accepts_nested_attributes_for :author

  def author_attributes=(attributes)
   self.author = Author.find_or_create_by(attributes) if !attributes['name'].empty? #NEED EXPLANATION //  SHOULD I USE :NAME INSTEAD OF ATTRIBUTES?
   self.author
  end
end

#not treating book as a join table