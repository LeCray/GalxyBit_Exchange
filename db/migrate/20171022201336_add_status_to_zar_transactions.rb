class AddStatusToZarTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :zar_transactions, :status, :string
  end
end
