class AddEthBalanceToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :eth_balance, :decimal
  end
end
