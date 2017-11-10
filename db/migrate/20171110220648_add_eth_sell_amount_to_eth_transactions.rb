class AddEthSellAmountToEthTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :eth_transactions, :ethSellAmount, :decimal
  end
end
