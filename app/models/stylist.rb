class Stylist < ActiveRecord::Base
    # belongs_to :user
    # accepts_nested_attributes_for :user

    has_many :appointments
    has_many :clients, through: :appointments

    has_many :stylist_services
    has_many :services, through: :stylist_services

    before_save { email.downcase! }
    before_save :titleize_name

    validate :has_at_least_one_service?

    validates_presence_of :level, message: 'must be selected' 
    validates :name, presence: true, length: { minimum: 2 }, length: { maximum: 50 }
    validates :handle, presence: true, length: { minimum: 2 }, length: { maximum: 50 }
 

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { minimum: 2 }, length: { maximum: 50 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }


    #For Creating New Service when Creating New Stylist: ... # note: not using the macro bc it will create a service every time ... => # accepts_nested_attributes_for :services
    def services_attributes=(service_attributes)
        service_attributes.values.each do |service_attribute|
            service = Service.find_or_create_by(service_attribute)
            self.services << service # self.post_services.build(service: service)
        end
    end

    def titleize_name
        self.name = name.titleize  
    end

    def has_at_least_one_service?
      errors.add(:base, 'Must have at least one Service') if self.services.empty?
    end

end