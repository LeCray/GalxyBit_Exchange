class AddEthBuyAmountToEthTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :eth_transactions, :ethBuyAmount, :decimal
  end
end
