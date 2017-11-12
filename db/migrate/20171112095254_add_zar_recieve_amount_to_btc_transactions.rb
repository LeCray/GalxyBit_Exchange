class AddZarRecieveAmountToBtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :btc_transactions, :zarRecieveAmount, :decimal
  end
end
