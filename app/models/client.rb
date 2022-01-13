class Client < ApplicationRecord
    has_many :appointments, :dependent => :destroy
    has_many :stylists, through: :appointments

    validates_presence_of :name, :email, :phone
    validates :phone, length: { is: 10 }

    before_save :titleize_name
    before_save { email.downcase! }
end
