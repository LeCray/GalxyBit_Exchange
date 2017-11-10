class AddLtcBuyAmountToLtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :ltc_transactions, :ltcBuyAmount, :decimal
  end
end
