class User < ApplicationRecord
    before_save { email.downcase! }

    has_secure_password

    validates :name, presence: true, length: { minimum: 2 }, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

    validates :password, presence: true, length: { minimum: 3 }, allow_nil: true  #allow_nil removes duplicate error messages from this validation and has_secure_pw (9.10 - https://3rd-edition.railstutorial.org/book/updating_and_deleting_users#sec-successful_edits)
end
