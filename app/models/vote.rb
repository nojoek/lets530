class Vote < ActiveRecord::Base
  attr_accessible :event_id, :event_time_id, :location_id, :user_id
  
  belongs_to :locations
  belongs_to :event_times
  belongs_to :users
  belongs_to :event 
end
