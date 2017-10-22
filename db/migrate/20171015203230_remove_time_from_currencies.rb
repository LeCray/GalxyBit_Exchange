class RemoveTimeFromCurrencies < ActiveRecord::Migration[5.0]
  def change
    remove_column :currencies, :time, :time
  end
end
