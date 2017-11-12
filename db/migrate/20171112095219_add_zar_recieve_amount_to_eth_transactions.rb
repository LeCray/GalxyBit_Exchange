class AddZarRecieveAmountToEthTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :eth_transactions, :zarRecieveAmount, :decimal
  end
end
