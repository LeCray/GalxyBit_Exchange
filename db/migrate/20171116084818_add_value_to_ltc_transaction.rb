class AddValueToLtcTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :ltc_transactions, :value, :decimal
  end
end
