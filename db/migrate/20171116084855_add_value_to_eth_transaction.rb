class AddValueToEthTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :eth_transactions, :value, :decimal
  end
end
