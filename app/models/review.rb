class Review < ApplicationRecord  
  belongs_to :user
  belongs_to :book

  validates :title, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 11} #prevent someone from giving it 100 instead of 1-10
  #two piece validation:
  validates :book, uniqueness: {scope: :user, message: "has already been reviewed by you"}

  def self.alphabetize #scope method
    order(:title) #sql? default is asc order
    #activerecord scope method joins
  end
end
