class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user 
  has_many :reviews
  has_many :users, through: :reviews 
  accepts_nested_attributes_for :author

  validates :title, presence: true 
  validates :author, presence: true
  validate :no_duplicates 

  scope :alphabetize, -> { order(:title) }

  def author_attributes=(attributes) 
    self.author = Author.find_or_create_by(attributes) if !attributes['name'].empty?
    self.author
  end
  
  def no_duplicates
    book = Book.find_by(title: title, author_id: author_id) 
    if !!book && book != self  
      errors.add(:title, 'has already been added for that author') 
    end
  end

  def title_and_author
    "#{title} - #{author.name}"
  end
end
