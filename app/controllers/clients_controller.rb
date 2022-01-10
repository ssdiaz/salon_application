class ClientsController < ApplicationController
    before_action :require_logged_in, only: [:new, :edit]
    
    def new
        @client = Client.new
    end
    
    def create
        @client = Client.new(client_params)
        if @client.save
            # log_in @client #session[:user_id] = client.id
            # flash[:success] = "Welcome to the Salon App! MERP"
            redirect_to @client #user_url(@client) or users#show -- profile page -- think I want this to be appointment in future
        else
            render 'new'
        end
    end

    def index
        @clients = Client.all
    end

    def show
        @client = Client.find(params[:id])
    end

    def edit
        @client = Client.find(params[:id])
    end

    def update
        @client = Client.find(params[:id])
        @client.update(client_params)
        if @client.valid?
            redirect_to @client
        else
            render 'edit'
        end
    end

    def destroy
        Client.find(params[:id]).destroy
        redirect_to clients_path
    end

    private
    def client_params
        params.require(:client).permit(:name, :email, :phone)
    end
end
