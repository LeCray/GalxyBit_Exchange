class AddReferralIdToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :referral_id, :integer
  end
end
