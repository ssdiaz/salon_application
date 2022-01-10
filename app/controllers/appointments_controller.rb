class AppointmentsController < ApplicationController
    # has_scope :filter_by_stylist
    before_action :require_logged_in
    # skip_before_action :require_login, only: [:index] #for anyone to see a list of appointments

    def new
        @appointment = Appointment.new(stylist_id: params[:stylist_id])
        # @stylist = Stylist.find(params[:stylist_id]) if params[:stylist_id]
        @stylist = @appointment.stylist if params[:stylist_id]
        # @stylist = Stylist.find(params[:stylist_id]) 
    end

    def create
        @appointment = Appointment.new(appointment_params) #(appointment_params.merge(client_id: current_user.id))
        # @appointment = Appointment.new(appointment_params.merge(client_id: current_user.id))
        if @appointment.save
            redirect_to @appointment
        else
            render 'new'
        end
    end


    def index
        start_date = params.fetch(:start_date, Date.today).to_date   # Scope your query to the dates being shown
        if params[:stylist_id].present? 
            @appointments = Appointment.filter_by_stylist(params[:stylist_id]) 
            # @stylist = Appointment.by_stylist(params[:stylist_id]) #!!!!!!!!!!!!!!!!!!!!!!
            # @stylist = Stylist.find(params[:stylist_id]) 
            @stylist = Appointment.find_by(stylist_id: params[:stylist_id]).stylist
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
        params.require(:appointment).permit(:date, :price, :minutes, :stylist_id, :start_time, :end_time, :client_id, service_ids:[])
    end

end
