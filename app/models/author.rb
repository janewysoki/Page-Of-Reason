class Author < ApplicationRecord
    has_many :books
    validates :name, presence: true, uniqueness: true

    #scope :alphabetize -> {order(:name)}  #what is this doing
    def self.alphabetize #scope method
        order(:name) #sql? default is asc order
    end
end
