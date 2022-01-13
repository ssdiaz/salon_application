class AppointmentService < ApplicationRecord
    belongs_to :appointment
    belongs_to :service

    validates_uniqueness_of :service, :scope => :appointment
end
