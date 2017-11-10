class RemoveAmountFromLtcTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :ltc_transactions, :amount, :decimal
  end
end
