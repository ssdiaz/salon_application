class Appointment < ActiveRecord::Base
    belongs_to :client
    belongs_to :stylist

    belongs_to :schedule

    has_many :appointment_services
    has_many :services, through: :appointment_services
end
