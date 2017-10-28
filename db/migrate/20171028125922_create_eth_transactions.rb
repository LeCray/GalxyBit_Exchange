class CreateEthTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :eth_transactions do |t|
      t.string :transaction_type
      t.decimal :amount
      t.integer :account_id
      t.string :status

      t.timestamps
    end
  end
end
