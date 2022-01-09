module ServicesHelper

    def services_for_stylist(stylist)
        Service.where(id = stylist)
    end
end
