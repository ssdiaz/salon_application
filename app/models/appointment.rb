class Appointment < ActiveRecord::Base

    scope :filter_by_stylist, -> (stylist_id) { where stylist_id: stylist_id }

    # belongs_to :client
    belongs_to :stylist

    has_many :appointment_services
    has_many :services, through: :appointment_services


    validates_presence_of :start_time, message: 'error, must choose a Date and Time' 


    validate :has_at_least_one_service?
    def has_at_least_one_service?
      errors.add(:base, 'Must have at least one Service') if self.services.empty?
    end

    validate :has_stylist?     # validates :stylist, presence: true 
    def has_stylist?
        errors.add(:base, 'Must choose a Stylist') if self.stylist.blank?
    end


    # validate :stylist_has_service?
    # validate :stylist_has_service?
    before_validation :stylist_has_service?, only: [:create, :new]

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





    after_validation :set_cost, :set_duration #, only: [:create, :update]
    def set_cost
        self.cost = self.services.collect {|service| service.price}.sum
    end
    def set_duration
        self.duration = self.services.collect {|service| service.minutes}.sum
    end

end
