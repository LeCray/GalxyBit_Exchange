class RemoveBalanceFromAccounts < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :balance, :decimal
  end
end
