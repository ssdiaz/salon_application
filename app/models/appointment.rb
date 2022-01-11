class Appointment < ActiveRecord::Base
    belongs_to :client
    belongs_to :stylist

    has_many :appointment_services
    has_many :services, through: :appointment_services

    validates_presence_of :start_time, message: 'error, must choose a Date and Time' 
    validates_presence_of :stylist

    validate :has_at_least_one_service?
    before_validation :stylist_has_service?
    before_save :set_cost, :set_duration, :set_end_time #after_validation 

    scope :filter_by_stylist, -> (stylist_id) { where stylist_id: stylist_id }

    private
    def has_at_least_one_service?
        errors.add(:base, 'Must have at least one Service') if self.services.empty?
    end

    def stylist_has_service?
        if self.stylist
            self.services.each do |apt_service| 
                if !self.stylist.services.include?(apt_service) 
                    errors.add(:base, 'Please choose a different Stylist that offers the services selected') 
                    return false
                end
            end    
        end
    end 

    def set_cost
        self.cost = self.services.collect {|service| service.price}.sum # self.cost = self.services.pluck(:price).sum
    end

    def set_duration
        self.duration = self.services.collect {|service| service.minutes}.sum 
    end

    def set_end_time
        self.end_time = self.start_time  + (self.duration*60) unless !self.end_time
    end
end
