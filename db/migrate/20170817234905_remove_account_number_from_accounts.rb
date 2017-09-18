class RemoveAccountNumberFromAccounts < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :account_number, :string
  end
end
