class StylistService < ApplicationRecord
    belongs_to :stylist
    belongs_to :service

    validates_uniqueness_of :service, :scope => :stylist
end