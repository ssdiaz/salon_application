class AppointmentsController < ApplicationController
    # has_scope :filter_by_stylist


    def new
        @appointment = Appointment.new(stylist_id: params[:stylist_id])
        puts params 
        puts "- - - - - - - !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        # if params[:stylist_id] && !Stylist.exists?(params[:stylist_id])
        @stylist = Stylist.find(params[:stylist_id]) if params[:stylist_id]
    end

    def create
        @appointment = Appointment.new(appointment_params) #(appointment_params.merge(user_id: current_user.id))
        
        puts params
        puts "- - - - - - - - - - - - - - - - - "

         if @appointment.save
            redirect_to @appointment
         else
            render 'new'
         end



    end


    def index
        # Scope your query to the dates being shown:
        start_date = params.fetch(:start_date, Date.today).to_date
        # @appointments = Appointment.all #where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
        # @appointments = @appointments.filter_by_stylist(params[:stylist_id]) if params[:stylist_id].present?
        # @appointments = Appointment.filter_by_stylist(params[:stylist_id]) if params[:stylist_id].present?
        puts params 
        puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - "

        if params[:stylist_id].present? 
            @appointments = Appointment.filter_by_stylist(params[:stylist_id]) 
            @stylist = Stylist.find(params[:stylist_id])
        else
            @appointments = Appointment.all
        end
        
        @stylists = Stylist.all
    end


    def show
        @appointment = Appointment.find(params[:id])
        @appointments = Appointment.all
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def update
        @appointment = Appointment.find(params[:id])
        @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)
    end

    def destroy
        Appointment.find(params[:id]).destroy
        redirect_to appointments_path
    end


    private

    def appointment_params
        params.require(:appointment).permit(:date, :price, :minutes, :stylist_id, :start_time, :end_time, service_ids:[]) #:client_id,
    end

end
