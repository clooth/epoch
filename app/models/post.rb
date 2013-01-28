class Post < ActiveRecord::Base
  attr_accessible :body, :consumed, :date_added, :date_posted, :user_id

  belongs_to :user
end
