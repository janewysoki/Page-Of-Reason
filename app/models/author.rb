class Author < ApplicationRecord
    has_many :books
    validates :name, presence: true, uniqueness: true

    scope :alphabetize, -> { order(:name) }
    scope :search, -> (search_word) { where("name LIKE ?", "#{search_word}%") }
end
