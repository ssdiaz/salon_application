class LevelValidator < ActiveModel::Validator




        def validate(record)
          unless record.level.match? 1,2,3,4,5
            record.errors.add :limit, "Need a name starting with X please!"
          end
        end
      end
      
      class Stylist
        include ActiveModel::Validations
        validates_with LevelValidator
      end
      
end


class HandleValidator < ActiveModel::Validator

    def validate(record)
      unless record.handle.match? "@"
        record.errors.add :handle, "Need handle to start with @."
      end
    end
  end
  
  class Stylist
    include ActiveModel::Validations
    validates_with HandleValidator
  end
  
end