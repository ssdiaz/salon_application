module ServicesHelper
    def services_for_stylist(stylist)
        Service.where(id = stylist)
    end

    def order_service_by_name(services)
        services.order(:name)
    end
end
