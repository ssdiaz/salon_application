module AppointmentsHelper
    def start_time(appointment)
        appointment.start_time.strftime("%I:%M %p")
    end

    def end_time(appointment)
        appointment.end_time.strftime("%I:%M %p")
    end

    def date(appointment)
        appointment.start_time.strftime("%b %d, %Y")
    end
end
