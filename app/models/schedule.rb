class Schedule < ActiveRecord::Base
  attr_accessible :basedate, :repeat_type, :user_id

  belongs_to :user
end
