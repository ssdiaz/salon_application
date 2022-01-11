class ClientsController < ApplicationController
    before_action :require_logged_in, only: [:new, :edit]
    
    def new
        @client = Client.new
    end
    
    def create
        @client = Client.new(client_params)
        if @client.save
            flash[:success] = "Client Created"
            redirect_to clients_path
        else
            render 'new'
        end
    end

    def index
        if params[:query]
            @clients = Client.where("name LIKE ?", params[:query])
        else
            @clients = Client.all.order(:name)
        end
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
            flash[:success] = "Client Saved"
            redirect_to clients_path
        else
            render 'edit'
        end
    end

    def destroy
        Client.find(params[:id]).destroy
        flash[:success] = "Client Deleted"
        redirect_to clients_path
    end

    private
    def client_params
        params.require(:client).permit(:name, :email, :phone)
    end
end
