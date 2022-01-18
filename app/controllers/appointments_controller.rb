class AppointmentsController < ApplicationController
    before_action :require_logged_in

    def new
        @appointment = Appointment.new(stylist_id: params[:stylist_id], client_id: params[:client_id])
        @stylist = @appointment.stylist if params[:stylist_id]
    end

    def create
        @appointment = Appointment.create(appointment_params)
        if @appointment.valid?
            flash[:success] = "Appointment Created"
            redirect_to @appointment
        else
            render 'new'
        end
    end

    def index
        # start_date = params.fetch(:start_date, Date.today).to_date
        if params[:stylist_id].present?
            @appointments = Appointment.filter_by_stylist(params[:stylist_id]).order(:start_time)
            @stylist = Stylist.find_by(id: params[:stylist_id])
            flash[:success] = "No Appointments currently for Stylist: #{Stylist.find(params[:stylist_id]).name}" if Appointment.find_by(stylist_id: params[:stylist_id]).nil?
        else
            @appointments = Appointment.all.order(:start_time)
        end
        @stylists = Stylist.all.order(:name)
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
            flash[:success] = "Appointment Saved"
            redirect_to appointment_path(@appointment)
        else
            render 'edit'
        end
    end

    def destroy
        Appointment.find(params[:id]).destroy
        flash[:success] = "Appointment Deleted"
        redirect_to appointments_path
    end

    private

    def appointment_params
        params.require(:appointment).permit(:cost, :duration, :client_id, :stylist_id, :start_time, :end_time, service_ids:[])
    end

end
