class Service < ActiveRecord::Base
    has_many :appointment_services
    has_many :appointments, through: :appointment_services

    has_many :stylist_services
    has_many :stylists, through: :stylist_services



end
