class Stylist < ActiveRecord::Base
    # belongs_to :user
    # accepts_nested_attributes_for :user

    has_many :appointments
    has_many :clients, through: :appointments

    has_many :stylist_services
    has_many :services, through: :stylist_services

    has_one :schedule


    # not using the macro bc it will create a service every time
        # accepts_nested_attributes_for :services
    def services_attributes=(service_attributes)
        service_attributes.values.each do |service_attribute|
            service = Service.find_or_create_by(service_attribute)
        #   self.post_services.build(service: service)
            self.services << service
        end
    end

end