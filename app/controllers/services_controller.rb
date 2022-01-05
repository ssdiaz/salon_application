class ServicesController < ApplicationController

    def index
        if params[:stylist_id]
            @services = Stylist.find(params[:stylist_id]).services
        else
            @services = Service.all
        end
    end

    def new
        @service = Service.new
    end

    def create
        @service = Service.new(service_params)
        if @service.save

            puts params

            redirect_to @service 
        else
            render 'new'
        end
    end

    def show
        # @service = Service.find_by(id: params[:id])
        @service = Service.find(params[:id])
    end


    private

    def service_params
        params.require(:service).permit(:name, :minutes, :price, stylist_ids:[])
    end

end
