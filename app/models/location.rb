class Location < ActiveRecord::Base
  attr_accessible :event_id, :loc1, :loc2, :loc3, :loc4
  
  belongs_to :event
  
  # def location
  #       Location.find_by_id(self.location_id)
  #     end
    
validates :name, presence: true
end
