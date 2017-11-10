class RemoveAmountFromBtcTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :btc_transactions, :amount, :decimal
  end
end
