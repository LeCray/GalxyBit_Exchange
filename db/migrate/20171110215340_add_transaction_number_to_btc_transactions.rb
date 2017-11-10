class AddTransactionNumberToBtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :btc_transactions, :transaction_number, :decimal
  end
end
