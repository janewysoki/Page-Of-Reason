class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_books, through: :reviews, source: :book
    has_many :books # that the user has created
    
    validates :username, uniqueness: true, presence: true
    
    has_secure_password #(gives us authenticate )

    def self.set_google_omniauth(auth) #class levelmethod because it is being called on my user class
        self.find_or_create_by(username: auth[:info][:email]) do |u| #explain do block
            u.password = SecureRandom.hex #sets random password
        end
    end

end
