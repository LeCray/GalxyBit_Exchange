class CreateZarTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :zar_transactions do |t|
      t.string :transaction_type
      t.decimal :amount
      t.integer :account_id
      t.decimal :transaction_number

      t.timestamps
    end
  end
end
