class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :provider, :uid, :token, :token_secret, :token_expiry

  belongs_to :user
end
