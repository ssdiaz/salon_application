module ClientsHelper
    def display_client_name(appointment)
        if appointment.client 
            client = Client.find(appointment.client_id)
            client.name
        elsif params[:client_id]
            client = Client.find(params[:client_id])
            client.name
        end
    end
end
