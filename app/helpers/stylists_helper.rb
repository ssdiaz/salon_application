module StylistsHelper
    def display_stylist_name(appointment)
        # if appointment.stylist_id
        stylist = Stylist.find(appointment.stylist_id)
        stylist.name
        # end
    end

    def stylist_id(appointment)
        # if appointment.stylist_id
        stylist = Stylist.find(appointment.stylist_id)
        stylist.id
        # end
    end
end
  