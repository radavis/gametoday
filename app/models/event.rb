class Event < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :datetime_local
  validates_presence_of :type
  validates_presence_of :city
  validates_presence_of :venue
  validates_presence_of :url
end
