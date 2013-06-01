class Event < ActiveRecord::Base

def to_param
  "#{id} #{title}".parameterize
end

  attr_accessible :description, :final_destination, :final_time, :title, :user_id

has_many :locations
has_many :event_times
has_many :votes
belongs_to :user  ####belongs to or has many?

 
  
end
