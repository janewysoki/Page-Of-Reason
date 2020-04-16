class Author < ApplicationRecord
    has_many :books
    validates :name, presence: true, uniqueness: true

    #scope :alphabetize -> {order(:name)}
    def self.alphabetize #scope method?
        order(:name) #sql? default is asc order
    end
end
