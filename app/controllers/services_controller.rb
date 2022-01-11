class ServicesController < ApplicationController
    before_action :require_logged_in, only: [:new, :edit]

    def new
        @service = Service.new
    end

    def create
        @service = Service.new(service_params)
        if @service.save
            flash[:success] = "Service Created"
            redirect_to @service 
        else
            render 'new'
        end
    end

    def index
        if params[:stylist_id]
            @services = Stylist.find(params[:stylist_id]).services
        else
            @services = Service.all
        end
    end

    def show
        @service = Service.find(params[:id])
        @stylist = Stylist.find_by(id: params[:stylist_id])
    end

    def edit        
        @service = Service.find(params[:id])
    end

    def update
        @service = Service.find(params[:id])
        @service.update(service_params)
        if @service.valid?
            flash[:success] = "Service Saved"
            redirect_to service_path(@service)
        else
            render 'edit'
        end
    end

    def destroy
        Service.find(params[:id]).destroy
        flash[:success] = "Service Deleted"
        redirect_to services_path
    end

    private

    def service_params
        params.require(:service).permit(:name, :minutes, :price, stylist_ids:[])
    end

end
