class Schedule < ActiveRecord::Base
    belongs_to :stylist
    has_many :appointments

    #hours from 8AM to 8PM a stylist can work for. 
    WORKING_HOURS = [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

    DAYS_OF_WEEK = ['Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] #Salon closed on 'Monday'







end
