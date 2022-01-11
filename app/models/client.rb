class Client < ActiveRecord::Base
    has_many :appointments
    has_many :stylists, through: :appointments

    validates_presence_of :name, :email, :phone

    before_save :titleize_name

    private
    
    def titleize_name
        self.name = name.titleize  
    end
end
