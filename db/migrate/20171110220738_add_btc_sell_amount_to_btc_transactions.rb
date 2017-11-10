class AddBtcSellAmountToBtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :btc_transactions, :btcSellAmount, :decimal
  end
end
