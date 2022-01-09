class Appointment < ActiveRecord::Base
    # belongs_to :client
    belongs_to :stylist

    has_many :appointment_services
    has_many :services, through: :appointment_services

    # validates :stylist, presence: true 
    # validates :start_time, presence: true, message: 'Put some address please'
    validates_presence_of :start_time, message: 'error, must choose a Date and Time' 

    validate :has_at_least_one_service?
    validate :has_stylist?
    validate :stylist_has_service?


    def has_at_least_one_service?
      errors.add(:base, 'Must have at least one Service') if self.services.empty?
    end

    def has_stylist?
        errors.add(:base, 'Must choose a Stylist') if self.stylist.blank?
    end

    def stylist_has_service?
        errors.add(:base, 'Please choose a different Stylist that offers the services selected') unless self.stylist.services.include?(:service)
    end

    scope :filter_by_stylist, -> (stylist_id) { where stylist_id: stylist_id }

end
