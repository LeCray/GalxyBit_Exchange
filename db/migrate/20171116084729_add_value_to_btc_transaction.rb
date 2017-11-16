class AddValueToBtcTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :btc_transactions, :value, :decimal
  end
end
