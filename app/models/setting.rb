class Setting < ActiveRecord::Base
  validates_presence_of :key, :value
  attr_accessible :key, :value
end
