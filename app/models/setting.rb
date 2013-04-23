class Setting < ActiveRecord::Base
  validates_presence_of :key, :value
  attr_accessible :key, :value

  def self.max_users_in_group
    find_or_create_by_key('max_users_in_group', value: 15)
      .value
      .to_i
  end
end
