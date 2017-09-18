class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :client, foreign_key: true
      t.decimal :balance
      t.string :account_number

      t.timestamps
    end
  end
end
