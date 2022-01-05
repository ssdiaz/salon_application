class AppointmentServices < ActiveRecord::Base
    belongs_ to :appointment
    belongs_to :service
end
