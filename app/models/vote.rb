

class Vote < ActiveRecord::Base
  attr_accessible :event_id, :event_time_id, :location_id, :user_id, :location, :event_time, :event_time_column, :event_location_column, :token
  
  # after_initialize :set_uuid
  
  # has_many :locations
  # has_many :event_times
  belongs_to :location
  belongs_to :event_time
  belongs_to :user
  belongs_to :event
  
  # def set_uuid
  #    self.token = SecureRandom.uuid
  # end
  
  
  
end
