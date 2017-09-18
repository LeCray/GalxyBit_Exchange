class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.references :account, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
