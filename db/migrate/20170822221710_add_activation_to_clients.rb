class AddActivationToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :activation_digest, :string
    add_column :clients, :activated, :boolean
    add_column :clients, :activated_at, :datetime
  end
end
