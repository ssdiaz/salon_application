class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new
    end

    def index
        # Scope your query to the dates being shown:
        start_date = params.fetch(:start_date, Date.today).to_date
        @appointments = Appointment.all #where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
        # @appointments = Appointment.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    end

    def create
        @appointment = Appointment.new(appointment_params) #(appointment_params.merge(user_id: current_user.id))
        puts params
         if @appointment.save
            redirect_to @appointment
         else
            render 'new'
         end
    end

    def show
        @appointment = Appointment.find(params[:id])
        @appointments = Appointment.all
    end


    private

    def appointment_params
        params.require(:appointment).permit(:date, :price, :minutes, :stylist_id, :start_time, :end_time, service_ids:[]) #:client_id,
    end

end
