class MakeTokenExpiryNullable < ActiveRecord::Migration
  def up
    change_column :authentications, :token_expiry, :datetime, :null => true
  end

  def down
    change_column :authentications, :token_expiry, :datetime, :null => false
  end
end
