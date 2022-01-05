class Schedule < ActiveRecord::Base
    belongs_ to :stylist

    has_many :appointments
end
