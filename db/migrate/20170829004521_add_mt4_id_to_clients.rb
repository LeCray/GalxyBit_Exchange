class AddMt4IdToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :mt4_id, :integer
  end
end
