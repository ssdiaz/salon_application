class StylistService < ActiveRecord::Base
    belongs_to :stylist
    belongs_to :service
end