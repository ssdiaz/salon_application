class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  
  private
    
  def titleize_name
    self.name = name.titleize  
  end
end
