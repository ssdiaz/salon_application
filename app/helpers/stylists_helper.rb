module StylistsHelper
    # def stylist_name
    #     self.try(:stylist).try(:name)
    # end
    
    # def stylist_name=(name)
    #     stylist = Stylist.find_or_create_by(name: name)
    #     self.stylist = stylist
    # end

#- - -- - -- - - - -- - - - - - - - - - - - - - - - - - - -  - - 

    def display_stylist_name(appointment)
        if appointment.stylist_id
            stylist = Stylist.find(appointment.stylist_id)
            stylist.name
        end
    end

end
  