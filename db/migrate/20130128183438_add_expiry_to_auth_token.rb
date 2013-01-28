class AddExpiryToAuthToken < ActiveRecord::Migration
  def change
    add_column :authentications, :token_expiry, :datetime
    Authentication.all.each do |auth|
      auth.update_attributes! :token_expiry => DateTime.now
    end
  end
end
