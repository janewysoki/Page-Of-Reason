class Author < ApplicationRecord
    has_many :books
    validates :name, presence: true, uniqueness: true
end
