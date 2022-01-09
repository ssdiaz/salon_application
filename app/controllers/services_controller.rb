class ServicesController < ApplicationController

    def new
        @service = Service.new
        puts params
        puts "- - - -- -  -- - - - -- -  - - -"
        puts params[:stylist_ids]
        puts "- - - -- -  -- - - - -- -  - - -"
    end

    def create
        puts params
        puts "- - - -- -  -- - - - -- -  - - -"
        puts params[:stylist_ids]
        puts "- - - -- -  -- - - - -- -  - - -"


        @service = Service.new(service_params)
        if @service.save

            puts params

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
        puts params
        puts " - - - - -  - - - - - - - - - - - - - - "

        @service = Service.find(params[:id])
        @stylist = Stylist.find_by(id: params[:stylist_id])
    end

    def edit        
        puts params
        puts " - - - - -  - - - - - - - - - - - - - - "

        @service = Service.find(params[:id])
    end

    def update
        @service = Service.find(params[:id])
        @service.update(service_params)
        redirect_to service_path(@service)
    end

    def destroy
        Service.find(params[:id]).destroy
        redirect_to services_path
    end


    private

    def service_params
        params.require(:service).permit(:name, :minutes, :price, stylist_ids:[])
    end

end
