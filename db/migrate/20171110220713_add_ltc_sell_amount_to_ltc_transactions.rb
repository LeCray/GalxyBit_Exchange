class AddLtcSellAmountToLtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :ltc_transactions, :ltcSellAmount, :decimal
  end
end
