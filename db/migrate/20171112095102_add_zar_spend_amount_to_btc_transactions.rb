class AddZarSpendAmountToBtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :btc_transactions, :zarSpendAmount, :decimal
  end
end
