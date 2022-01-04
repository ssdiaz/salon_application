class User < ApplicationRecord
    before_save { email.downcase! }

    validates :name, presence: true, length: { minimum: 2 }, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { minimum: 2 }, length: { maximum: 50 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    # validates :email, uniqueness: true

    has_secure_password
    validates :password, presence: true, length: { minimum: 3 }
end
