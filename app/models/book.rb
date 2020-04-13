class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user #creator of it/singular user instances
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed it/plural user instances
  accepts_nested_attributes_for :author

  validates :title, presence: true #validates is plural for default validations/non custom validations; validates always followed by an attribute
  validate :no_duplicates #validates is singular when we have written a custom validator in the model
  #difference between validate and validateS?

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(rating)')} #including left means it will return all books even those without ratings

  def author_attributes=(attributes)
   self.author = Author.find_or_create_by(attributes) if !attributes['name'].empty? #NEED EXPLANATION //  SHOULD I USE :NAME INSTEAD OF ATTRIBUTES?
   self.author
  end
  
  def no_duplicates
    #if there's already a book with this title and author, throw an error
    book = Book.find_by(title: title, author_id: author_id) #why author ID and not author
    if !!book && book != self  
      errors.add(:title, 'has already been added for that author') # - view it <a href="%{/books/#{id}}"> here'</a>)
    end
  end

  def self.alphabetize #scope method
    order(:title) #sql? default is asc order
  end

  def title_and_author #reader method
    "#{title} - #{author.name}"
  end

end

#not treating book as a join table

#scope methods are intended to be methods that are classable methods and intended to be methods that are changing the scopr of a collection. instead of looking at all books, we look at books with rating. or we look at it in a speciic order. 
#model methods  tend ot be any methods that are querying the database; has to do with grabbing things from db
#helper methods tend to be very specific view methods only used in the views; has to do with how things are displayed; controllers can't access
