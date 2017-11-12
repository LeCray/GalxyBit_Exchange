class AddZarSpendAmountToEthTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :eth_transactions, :zarSpendAmount, :decimal
  end
end
