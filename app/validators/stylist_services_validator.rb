class StylistServicesValidator < ActiveModel::Validator 
    
    def validate(record)
        unless record.stylist.services.include?(record.services)      
    end

end