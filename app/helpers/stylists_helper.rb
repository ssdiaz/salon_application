module StylistsHelper
    #display Stylist Name if new Appointment through Stylist
    def display_stylist_name(appointment)
        if appointment.stylist 
            stylist = Stylist.find(appointment.stylist_id)
            stylist.name
        elsif params[:stylist_id]
            stylist = Stylist.find(params[:stylist_id])
            stylist.name
        end
    end

    #grab Stylist Id for new Appointment through Stylist
    def stylist_id(appointment)
        if appointment.stylist_id
            stylist = Stylist.find(appointment.stylist_id)
            stylist.id
        end
    end
end