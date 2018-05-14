class User < ApplicationRecord
    has_many :products, dependent: :nullify
    has_many :reviews, dependent: :nullify
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
#                       letters.dot-dashes.e@letters.com.uk.etc
    validates(
        :email,
        presence: true,
        uniqueness: true,
        format: VALID_EMAIL_REGEX
    )
    def full_name
        first_name + " " + last_name
    end
end
