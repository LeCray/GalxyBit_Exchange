class RemoveMt4IdFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :mt4_id, :integer
  end
end
