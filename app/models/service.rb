class Service < ApplicationRecord
  has_many :appointment_services, :dependent => :destroy
  has_many :appointments, through: :appointment_services, :dependent => :destroy

  has_many :stylist_services, :dependent => :destroy
  has_many :stylists, through: :stylist_services, :dependent => :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :minutes, presence: true, numericality: true
  validates :price, presence: true, numericality: true

  validate :has_at_least_one_stylist?

  before_save :titleize_name

  private 

  def has_at_least_one_stylist?
    errors.add(:base, 'Must have at least one Stylist') if self.stylists.empty?
  end
end
