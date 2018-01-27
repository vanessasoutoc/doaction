class City < ApplicationRecord
    
    has_many :addresses

    def name_with_initial
        "#{name.first}"
    end

end
