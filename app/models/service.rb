class Service < ActiveRecord::Base
  has_many :appointment_services
  has_many :appointments, through: :appointment_services

  has_many :stylist_services
  has_many :stylists, through: :stylist_services

  validates :name, presence: true, length: { minimum: 2 }, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :minutes, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  
  before_save :titleize_name
  validate :has_at_least_one_stylist?   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  private 
    def titleize_name
      self.name = name.titleize  
    end

    def has_at_least_one_stylist?
      errors.add(:base, 'Must have at least one Stylist') if self.stylists.empty?
    end
end
