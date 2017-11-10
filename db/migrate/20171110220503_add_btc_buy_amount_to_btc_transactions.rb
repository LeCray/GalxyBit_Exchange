class AddBtcBuyAmountToBtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :btc_transactions, :btcBuyAmount, :decimal
  end
end
