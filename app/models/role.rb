class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor 
        end
      end
    
      def locations
        self.auditions.map do |audition|
          audition.location
        end
      end
    
      def lead
        hired = self.auditions.find do |audition|
          audition.hired == true
        end
          if !hired
            "no actor has been hired for this role"
          else
            hired
          end
      end
    
      def understudy
        runnerup = self.auditions.filter do |audition|
          audition.hired == true
        end
        
          if runnerup.count > 1
            runnerup.second
          else
            "no actor has been hired for understudy for this role"
          end
      end
  end