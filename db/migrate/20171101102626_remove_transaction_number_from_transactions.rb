class RemoveTransactionNumberFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :transaction_number, :string
  end
end
