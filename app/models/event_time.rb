class EventTime < ActiveRecord::Base
  attr_accessible :event_id, :time1, :time2, :time3, :time4
  
  belongs_to :event
  
  
  # def event_time
  #      Event_time.find_by_id(self.event_time_id)
  #    end
    
end

