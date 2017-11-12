class AddZarRecieveAmountToLtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :ltc_transactions, :zarRecieveAmount, :decimal
  end
end
