class RemoveReferralFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :referral, :integer
  end
end
