class AddOtpToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :direct_otp, :string
    add_column :users, :direct_otp_sent_at, :string
    add_column :users, :verified, :boolean
    
  end
end
