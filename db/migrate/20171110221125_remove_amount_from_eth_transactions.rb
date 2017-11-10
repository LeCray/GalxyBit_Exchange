class RemoveAmountFromEthTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :eth_transactions, :amount, :decimal
  end
end
