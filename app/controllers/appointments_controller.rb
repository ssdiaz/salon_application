class AppointmentsController < ApplicationController
    before_action :require_logged_in

    def new
        @appointment = Appointment.new(stylist_id: params[:stylist_id], client_id: params[:client_id])
        @stylist = @appointment.stylist if params[:stylist_id]
    end

    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            redirect_to @appointment
        else
            render 'new'
        end
    end

    def index
        if params[:stylist_id].present? #if !params[:stylist_id].nil? #if params[:stylist_id].present? 
            @appointments = Appointment.filter_by_stylist(params[:stylist_id]).order(:start_time)
            # @stylist = Appointment.by_stylist(params[:stylist_id]) #!!!!!!!!!!!!!!!!!!!!!!
            # @stylist = Stylist.find(params[:stylist_id]) 
            @stylist = Appointment.find_by(stylist_id: params[:stylist_id]).stylist
            # @stylist = Appointment.by_stylist(params[:stylist])
        # elsif params[:stylist_id].nil?
        #     @appointments = Appointment.all
        else
            @appointments = Appointment.all
        end
        @stylists = Stylist.all
        # @stylist = Appointment.by_stylist(params[:stylist])
        
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
        if @appointment.valid?
            redirect_to appointment_path(@appointment)
        else
            render 'edit'
        end
    end

    def destroy
        Appointment.find(params[:id]).destroy
        redirect_to appointments_path
    end

    private

    def appointment_params
        params.require(:appointment).permit(:date, :price, :minutes, :start_time, :end_time, :stylist_id,  :client_id, service_ids:[])
    end

end
