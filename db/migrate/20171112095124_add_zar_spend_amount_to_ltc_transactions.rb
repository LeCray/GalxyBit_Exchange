class AddZarSpendAmountToLtcTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :ltc_transactions, :zarSpendAmount, :decimal
  end
end
