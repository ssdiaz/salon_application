class Client < ApplicationRecord
    before_save :titleize_name
    before_save { email.downcase! }

    has_many :appointments
    has_many :stylists, through: :appointments

    validates_presence_of :name, :email, :phone
end
