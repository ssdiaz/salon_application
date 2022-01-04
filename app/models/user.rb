class User < ApplicationRecord
    has_one :stylist_id
    has_one :client_id
    #need to add a validation that you can't have a stylist_id & client_id. one must be nil. 

    before_save { email.downcase! }

    validates :name, presence: true, length: { minimum: 2 }, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { minimum: 2 }, length: { maximum: 50 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    # validates :email, uniqueness: true

    has_secure_password
    validates :password, presence: true, length: { minimum: 3 }, allow_nil: true #allow_nil removes duplicate error messages from this validation and has_secure_pw (9.10 - https://3rd-edition.railstutorial.org/book/updating_and_deleting_users#sec-successful_edits)
end
