class CreateBtcTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :btc_transactions do |t|
      t.string :transaction_type
      t.decimal :amount
      t.integer :account_id
      t.string :status

      t.timestamps
    end
  end
end
