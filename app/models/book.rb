class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user #creator of it/singular user instances
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed it/plural user instances
  accepts_nested_attributes_for :author

  validates :title, presence: true
  validate :no_duplicates

  #difference between validate and validateS?

  def author_attributes=(attributes)
   self.author = Author.find_or_create_by(attributes) if !attributes['name'].empty? #NEED EXPLANATION //  SHOULD I USE :NAME INSTEAD OF ATTRIBUTES?
   self.author
  end
  
  def no_duplicates
    #if there's already a book with this title and brand, throw an error
    if Book.find_by(title: title, author_id: author_id) #why author ID and not author
      errors.add(:title, "has already been added for that author")
    end
  end

end

#not treating book as a join table