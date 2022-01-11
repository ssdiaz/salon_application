class Stylist < ActiveRecord::Base
  # belongs_to :user
  # accepts_nested_attributes_for :user

  has_many :appointments
  has_many :clients, through: :appointments

  has_many :stylist_services
  has_many :services, through: :stylist_services

  validates_presence_of :name, :handle
  validates_presence_of :level, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :level, :in => 0..5, message: 'must be selected from 1-5'
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validate :has_at_least_one_service?

  before_save { email.downcase! }
  before_save :titleize_name

  private
  def titleize_name
      self.name = name.titleize  
  end

  def has_at_least_one_service?
    errors.add(:base, 'Must have at least one Service') if self.services.empty?
  end
end