class AddTransactionNumberToLtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :ltc_transactions, :transaction_number, :decimal
  end
end
