class RemoveClientNumberFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :client_number, :string
  end
end
