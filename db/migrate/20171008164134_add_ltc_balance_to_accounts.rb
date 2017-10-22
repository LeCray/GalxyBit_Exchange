class AddLtcBalanceToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :ltc_balance, :decimal
  end
end
