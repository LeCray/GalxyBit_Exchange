class AddZarBalanceToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :zar_balance, :decimal
  end
end
