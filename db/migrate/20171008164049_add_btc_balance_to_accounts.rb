class AddBtcBalanceToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :btc_balance, :decimal
  end
end
