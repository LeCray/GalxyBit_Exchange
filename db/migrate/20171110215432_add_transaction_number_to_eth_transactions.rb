class AddTransactionNumberToEthTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :eth_transactions, :transaction_number, :decimal
  end
end
