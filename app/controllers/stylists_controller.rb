class StylistsController < ApplicationController
    before_action :require_logged_in, only: [:new, :edit]
    
    def new
        @stylist = Stylist.new
    end

    def index
        @stylists = Stylist.all
        @appointments = @appointments.filter_by_stylist(params[:appointment_ids]) if params[:appointment_ids].present?
    end

    def show
        @stylist = Stylist.find(params[:id])
    end

    def create
        @stylist = Stylist.new(stylist_params)
        if @stylist.save
            flash[:success] = "Stylist Created"
            redirect_to @stylist
        else
            render 'new'
        end
    end

    def edit
        @stylist = Stylist.find(params[:id])
    end

    def update
        @stylist = Stylist.find(params[:id])
        @stylist.update(stylist_params)
        if @stylist.valid?
            flash[:success] = "Stylist Saved"
            redirect_to @stylist
        else
            render 'edit'
        end
    end

    def destroy
        Stylist.find(params[:id]).destroy
        flash[:success] = "Stylist Deleted"
        redirect_to stylists_path
    end

    private

    def stylist_params
        params.require(:stylist).permit(:name, :email, :handle, :level, service_ids:[], appointment_ids:[]) 
    end

end