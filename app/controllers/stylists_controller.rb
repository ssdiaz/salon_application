class StylistsController < ApplicationController

    def new
        @stylist = Stylist.new
    end

    def index
        @stylists = Stylist.all
    end

    def show
        # @stylist = Stylist.find_by(id: params[:id])
        @stylist = Stylist.find(params[:id])
    end

    def create
        @stylist = Stylist.new(stylist_params)
        if @stylist.save

            puts params

            log_in @stylist #session[:user_id] = stylist.id
            flash[:success] = "Welcome to the Salon App!"
            redirect_to @stylist #user_url(@stylist) or users#show -- profile page -- think I want this to be appointment in future
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
        redirect_to stylist_path(@stylist)
    end

    def destroy
        Stylist.find(params[:id]).destroy
        redirect_to stylists_path
    end


    private

    def stylist_params
        params.require(:stylist).permit(:name, :email, :handle, :level, service_ids:[], services_attributes: [:name, :minutes, :price])
    end

end